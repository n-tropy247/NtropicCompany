@echo off
set /p UserInputPath=What Drive is the game installed to (Letter only)
echo(Detecting Game Installation Directory ...
for %%a in (%UserInputPath%) do (
    pushd "%%~a:\"
    for /f "tokens=*" %%b in ('dir /b /s /a:-d "Lethal Company.exe" 2^>nul ^| find /i "Lethal Company.exe" 2^>nul') do (
        for %%c in ("%%~b\.") do set "gameInstallationDirectory=%%~dpc"
    )
    popd 
)
echo(Game Installation Directory : %gameInstallationDirectory%

del /q /s "%gameInstallationDirectory%\BepInEx"
xcopy /e .\ "%gameInstallationDirectory%" /Y
xcopy /e ".\update-scripts-shortcuts\update-lethal-extended.bat" "%USERPROFILE%\Documents" /Y
echo(Install Finished!
pause