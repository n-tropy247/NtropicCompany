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

RMDIR /S /Q ".\BepInEx\"
RMDIR /S /Q ".\update-scripts-shortcuts\"
del /q /s ".\discord_game_sdk.dll"
del /q /s ".\doorstop_config.ini"
del /q /s ".\.gitattributes"
del /q /s ".\.gitignore"
del /q /s ".\icon.png"
del /q /s ".\install.bat"
del /q /s ".\update.bat"
del /q /s ".\winhttp.dll"
del /q /s "C:\%USERPROFILE%\Documents\update-lethal-extended.bat"
del /q /s ".\uninstall.bat"
echo(Lethal-Extended Uninstalled!
pause