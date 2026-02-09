@echo off
title Zipwn
color A

:: Check if 7-Zip is actually there
if not exist "C:\Program Files\7-Zip" (
    echo 7-Zip not installed! Grab it from 7-zip.org
    pause
    exit
)

echo.
echo  ______     _                
echo ^|___  /    (_)               
echo    / /_ __  _ __   __ _ __   
echo   / / ^| ^'_ \^| ^'\ \ /\ / / ^'_ \  
echo  ./ /_^| ^|_) ^| ^|\ V  V /^| ^| ^| ^| 
echo  \_____/^| .__/ ^|_^|\_/\_/ ^|_^| ^|_^| 
echo        ^| ^|                       
echo        ^|_^|                       
echo.

set /p archive="Target Archive (e.g., secret.zip): "
if not exist "%archive%" (
    echo Archive not found!
    pause
    exit
)

set /p wordlist="Wordlist File (e.g., rockyou.txt): "
if not exist "%wordlist%" (
    echo Wordlist not found!
    pause
    exit
)

echo Cracking...
:: The loop that does the heavy lifting
for /f %%a in (%wordlist%) do (
    set pass=%%a
    call :attempt
)

echo.
echo Password not found. Maybe try a bigger wordlist?
pause
exit

:attempt
"C:\Program Files\7-Zip\7z.exe" x -p%pass% "%archive%" -o"cracked" -y >nul 2>&1
echo ATTEMPT : %pass%

:: 0 means success
if /I %errorlevel% EQU 0 (
    echo.
    echo =================================
    echo Success! Password Found: %pass%
    echo =================================
    pause
    exit 
)