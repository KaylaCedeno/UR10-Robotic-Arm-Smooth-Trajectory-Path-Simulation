# UR10 Smooth Trajectory Drawing in CoppeliaSim

This project implements a smooth end‑effector trajectory for a UR10 robotic arm inside **CoppeliaSim Edu**, using **Lua**, **simIK**, and **parametric curve generation**. The robot traces a continuous flower‑shaped path in 3D space while maintaining a fixed end‑effector orientation. The trajectory is visualized in real time using CoppeliaSim’s drawing API.


## 🚀 Features

- **Inverse Kinematics (IK)** using `simIK`  
- **Smooth trajectory generation** using parametric equations  
- **Jerk‑limited motion** via `sim.moveToPose`  
- **Real‑time trajectory visualization** using drawing objects  
- **UR10 robot simulation** with fixed end‑effector orientation  
- **Fully looping animation** of a custom flower‑shaped curve

## How To Run
