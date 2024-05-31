@echo off
setlocal

:: Start adb server
adb start-server

:: Prompt the user for the port number
set /p PORT=Enter the port number: 

:: Define the IP address
set IP=XXXXXXXXXXX

:: Connect to the device using the provided IP address and port number
adb connect %IP%:%PORT%

:: Check if the connection was successful
if %errorlevel% neq 0 (
    echo Failed to connect to the device.
    pause
    exit /b %errorlevel%
)

:: Run scrcpy with the shortcut modifier set to left control
scrcpy --shortcut-mod=lctrl

:: After scrcpy is closed, disconnect and stop adb
adb disconnect %IP%:%PORT%
adb kill-server

endlocal
