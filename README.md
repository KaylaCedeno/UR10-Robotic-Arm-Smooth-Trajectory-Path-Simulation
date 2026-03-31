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
Absolutely — here’s a clean, professional **How To Run** section that includes:

- a clear requirement that the user must have **CoppeliaSim installed**  
- instructions that start with **downloading the `.ttt` scene file from the `scene/` folder**  
- a smooth, beginner‑friendly flow  

You can paste this directly into your README.

---

## 🧩 How To Run

### **Requirements**
You must have **CoppeliaSim Edu** installed on your computer.  
Download it from the official CoppeliaSim website before proceeding.

---

### **1. Download scene**
Download the file below from the `scene/` folder in this repository:

```
scene/UR10_Flower_Trajectory.ttt
```

Save it anywhere on your computer.

---

### **2. Open the Scene in CoppeliaSim**
1. Launch **CoppeliaSim Edu**  
2. Go to **File → Open Scene…**  
3. Select the downloaded file:  
   ```
   UR10_Flower_Trajectory.ttt
   ```

The UR10 robot and all associated scripts will load automatically.

---

### **3. Start the Simulation**
Click the **Play** button in the toolbar.  
The UR10 will begin tracing the smooth flower‑shaped trajectory in real time.

---

### **4. (Optional) Modify the Trajectory**
To draw different shapes (circles, spirals, multi‑petal flowers, etc.):

- Open the **UR10** child script  
- Edit the parametric equations inside the trajectory generation function  
- Restart the simulation to see the new path
