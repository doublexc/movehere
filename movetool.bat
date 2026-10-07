@echo off
setlocal enabledelayedexpansion

:: -------------------------------------------------------------
:: Configurations
:: -------------------------------------------------------------
:: กำหนดชื่อไฟล์ที่ต้องการให้ย้ายและติดตาม
set "TARGET_FILE=DCL1_7_10.exe"

:: ใช้โฟลเดอร์เดียวกับที่สคริปต์นี้อยู่ เป็นที่เก็บ current_path.txt
set "SCRIPT_DIR=%~dp0"
:: ตัด Backslash ตัวท้ายออกเพื่อความสะอาดของ Path
set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"
set "TRACKER_FILE=%SCRIPT_DIR%\current_path.txt"

:: -------------------------------------------------------------
:: Main Logic
:: -------------------------------------------------------------
:: 1. อ่านตำแหน่งล่าสุดของไฟล์
set "OLD_PATH="
if exist "%TRACKER_FILE%" (
    set /p OLD_PATH=<"%TRACKER_FILE%"
)

:: ถ้ายังไม่มีประวัติ ให้ถือว่าไฟล์เริ่มต้นอยู่ที่เดียวกับตัวสคริปต์
if not defined OLD_PATH (
    set "OLD_PATH=%SCRIPT_DIR%"
)

:: 2. ตรวจสอบว่าอยู่ที่โฟลเดอร์นี้อยู่แล้วหรือไม่
if /i "%OLD_PATH%"=="%CD%" (
    echo [Info] Target file is already in this directory: %CD%
    goto :end
)

:: 3. ตรวจสอบว่าไฟล์ต้นทางมีอยู่จริงหรือไม่
if not exist "%OLD_PATH%\%TARGET_FILE%" (
    echo [Error] Cannot find "%TARGET_FILE%" at:
    echo         "%OLD_PATH%"
    goto :end
)

:: 4. ย้ายไฟล์มาที่โฟลเดอร์ปัจจุบัน (%CD%)
echo Moving %TARGET_FILE%
echo   From: "%OLD_PATH%"
echo   To:   "%CD%"

move /-y "%OLD_PATH%\%TARGET_FILE%" "%CD%\" >nul
if errorlevel 1 (
    echo [Error] Failed to move the file!
    goto :end
)

:: 5. อัปเดตตำแหน่งล่าสุดลงไฟล์ Tracker
> "%TRACKER_FILE%" echo %CD%
echo [Success] Moved and updated tracker successfully.

:end
endlocal
