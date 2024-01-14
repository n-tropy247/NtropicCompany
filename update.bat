@echo off
set /p UserInputPath=What Drive is the game installed to (Letter only) -- (Stable-Branch Installer)
echo(Detecting Game Installation Directory ...
for %%a in (%UserInputPath%) do (
    pushd "%%~a:\"
    for /f "tokens=*" %%b in ('dir /b /s /a:-d "Lethal Company.exe" 2^>nul ^| find /i "Lethal Company.exe" 2^>nul') do (
        for %%c in ("%%~b\.") do set "gameInstallationDirectory=%%~dpc"
    )
    popd 
)
echo(Game Installation Directory : %gameInstallationDirectory%

RMDIR /S /Q "C:\update-temp\"
mkdir C:\update-temp
curl -L "https://lethal.pengucc.com/releases/Lethal-Extended-Latest.zip" --output "C:\update-temp\Lethal-Extended-Latest.zip"
powershell Expand-Archive "C:\update-temp\Lethal-Extended-Latest.zip" -DestinationPath "C:\update-temp"
powershell -command "Start-Sleep -s 2"
del /q /s "%gameInstallationDirectory%\BepInEx\*"
del /s "C:\update-temp\Lethal-Extended-Latest.zip"
xcopy /e "C:\update-temp" "%gameInstallationDirectory%" /Y
xcopy /e "C:\update-temp\update-scripts-shortcuts\update-lethal-extended.bat" "%USERPROFILE%\Desktop\" /Y
RMDIR /S /Q "C:\update-temp\"
echo(Update Finished!
pause