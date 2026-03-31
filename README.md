# UR10 Smooth Trajectory Drawing in CoppeliaSim

This project implements a smooth end‑effector trajectory for a UR10 robotic arm inside **CoppeliaSim Edu**, using **Lua**, **simIK**, and **parametric curve generation**. The robot traces a continuous flower‑shaped path in 3D space while maintaining a fixed end‑effector orientation. The trajectory is visualized in real time using CoppeliaSim’s drawing API.


## 🚀 Features

- **Inverse Kinematics (IK)** using `simIK`  
- **Smooth trajectory generation** using parametric equations  
- **Jerk‑limited motion** via `sim.moveToPose`  
- **Real‑time trajectory visualization** using drawing objects  
- **UR10 robot simulation** with fixed end‑effector orientation  
- **Fully looping animation** of a custom flower‑shaped curve


## 🧩 How To Run

1. **Open CoppeliaSim Edu**  
   Launch the CoppeliaSim application on your machine.

2. **Load the provided scene**  
   Go to **File → Open Scene…** and select:  
   ```
   UR10_Flower_Trajectory.ttt
   ```

3. **Verify the scripts are attached**  
   - The **UR10** model contains the main motion‑control script (IK + trajectory execution).  
   - The **tip** object contains the drawing/visualization script.  
   These load automatically with the scene.

4. **Start the simulation**  
   Click the **Play** button (▶) in the CoppeliaSim toolbar.  
   The UR10 will begin tracing the smooth flower‑shaped trajectory in real time.

5. **Optional: Modify the trajectory**  
   Inside the UR10 child script, adjust the parametric equations in the `generateTrajectory()` function to draw different shapes (circles, spirals, multi‑petal flowers, etc.).
