# MoveTool

A lightweight Windows batch utility that tracks and pulls a specific executable (`.exe`) into your current working directory on demand.

---

## 📌 Features

- **Dynamic Tracking:** Remembers the last directory of your file via `current_path.txt`.
- **Anywhere Execution:** Run directly from Command Prompt or from the File Explorer address bar.
- **Fail-safe:** Validates source files and prevents moving if the file is already in the target directory.

---

## 🚀 Setup & Installation

### 1. Clone or Download
Clone this repository or download `movetool.bat` to a permanent folder on your machine (e.g., `D:\Tools\movetool` or `C:\Utilities`).

### 2. Configure Target File
Open `movetool.bat` with a text editor and change `TARGET_FILE` to match your executable:
```bat
set "TARGET_FILE=YourProgramName.exe"
```
*(Place your `.exe` inside the same folder as `movetool.bat` initially)*

---

## ⚙️ How to Enable `movetool` Globally (PATH Setup)

To use `movetool` from any folder without typing the full path, add its folder to your Windows **PATH** environment variable:

### Method A: Via GUI (Recommended)
1. Press `Win + R`, type `sysdm.cpl`, and press **Enter**.
2. Go to the **Advanced** tab and click **Environment Variables...**.
3. Under **User variables** (or **System variables** for all users), find and select **Path**, then click **Edit...**.
4. Click **New**, paste the absolute path of the folder containing `movetool.bat` (e.g., `D:\Tools\movetool`).
5. Click **OK** on all dialog boxes to save.
6. Restart any open Command Prompt windows.

### Method B: Via PowerShell (Quick Setup)
Run this command in PowerShell to append the directory to your User PATH:
```powershell
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";D:\Tools\movetool", [EnvironmentVariableTarget]::User)
```
*(Replace `D:\Tools\movetool` with your actual folder path)*

---

## 📖 How to Use

### 1. In Command Prompt (CMD)
Navigate to any folder and run:
```cmd
movetool
```

### 2. In File Explorer Address Bar
Open any folder in File Explorer, click the top address bar, and type:
- `movetool` (Runs and closes automatically)
- `cmd /k movetool` (Runs and keeps the terminal window open to inspect output)
