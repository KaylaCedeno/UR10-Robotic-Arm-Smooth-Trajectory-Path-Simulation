sim = require 'sim'
simIK = require 'simIK'

function sysCall_init()
    -- Handles from the scene:
    simBase = sim.getObject('..')
    simTip = sim.getObject('../tip')
    simTarget = sim.getObject('../target')

    simJoints = {}
    for i = 1, 6 do
        simJoints[i] = sim.getObject('../joint', {index = i-1})
    end
    
    
    -- IK environment + group:
    ikEnv = simIK.createEnvironment()
    ikGroup = simIK.createGroup(ikEnv)
    simIK.setGroupCalculation(ikEnv, ikGroup, simIK.method_damped_least_squares, 0.01, 10)

    ikElement = simIK.addElementFromScene(
        ikEnv, ikGroup, simBase, simTip, simTarget, simIK.constraint_pose
    )

    -- Optional precision (keep or remove):
    simIK.setElementPrecision(ikEnv, ikGroup, ikElement, {0.0005, 0.005*math.pi/180})
end


local function moveToPoseCallback(data)
    -- Move the target dummy to the intermediate pose, then solve IK:
    sim.setObjectPose(data.auxData.target, data.pose)
    simIK.handleGroup(data.auxData.ikEnv, data.auxData.ikGroup, {syncWorlds = true})
end

local function moveToPose_viaIK(maxVel, maxAccel, maxJerk, targetPose, auxData)
    sim.moveToPose({
        pose = sim.getObjectPose(auxData.tip, sim.handle_world),
        targetPose = targetPose,
        maxVel = maxVel,
        maxAccel = maxAccel,
        maxJerk = maxJerk,
        callback = moveToPoseCallback,
        auxData = auxData
    })
end

function sysCall_thread()
    -- Motion limits (vx,vy,vz, vRot):
    local maxVel   = {0.45, 0.45, 0.45, 4.5}
    --local maxVel   = {4.5, 4.5, 4.5, 10.5}
    local maxAccel = {0.13, 0.13, 0.03, 1.24}
    --local maxAccel = {1.3, 1.3, 1.3, 12.4}
    local maxJerk  = {0.1,  0.1,  0.1,  0.2}
    --local maxJerk  = {1,  1,  1,  2}

    -- Read waypoint poses once (world frame):
    
    local center = {0.65, 0.00, 0.6}
    
    local R = 0.30
    
    local N = 20

    local w = {}
    local target0 = sim.getObjectPose(simTarget, sim.handle_world)
    local q = {target0[4],target0[5],target0[6],target0[7]} -- fixed orientation

    for k=0,N do
        local a = (2*math.pi*k)/N
        local x = center[1] + R*math.cos(a)
        local y = center[2] + R*math.sin(a)
        local z = center[3]
        w[#w+1] = {x,y,z, q[1],q[2],q[3],q[4]}
    end

    local data = {ikEnv = ikEnv, ikGroup = ikGroup, tip = simTip, target = simTarget}

    while true do
        for i = 1, #w do
            moveToPose_viaIK(maxVel, maxAccel, maxJerk, w[i], data)
        end
    end
end

function sysCall_cleanup()
    if ikEnv then simIK.eraseEnvironment(ikEnv) end
end
