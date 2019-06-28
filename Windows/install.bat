@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
if %ERRORLEVEL% GEQ 1 GOTO Error

REM install niceties -- these aren't strictly required for our agents, but they are useful when RDPing onto boxes
REM especially as Windows Server 2012 R2 doesn't let you use IE by default, and makes it a pain to download chrome
choco install notepadplusplus -y
if %ERRORLEVEL% GEQ 1 GOTO Error

choco install firefox -y
if %ERRORLEVEL% GEQ 1 GOTO Error

choco install rapidee -y
if %ERRORLEVEL% GEQ 1 GOTO Error

choco install git.install -params '"/GitAndUnixToolsOnPath"' -y
if %ERRORLEVEL% GEQ 1 GOTO Error

choco install awscli -y
if %ERRORLEVEL% GEQ 1 GOTO Error

choco install cuda -y
if %ERRORLEVEL% GEQ 1 GOTO Error

refreshenv

curl -L https://github.com/colmap/colmap/releases/download/3.6-dev.2/COLMAP-dev-windows.zip > COLMAP-dev-windows.zip
if %ERRORLEVEL% GEQ 1 GOTO Error

C:\ProgramData\chocolatey\tools\7z x COLMAP-dev-windows.zip -oC:\colmap
if %ERRORLEVEL% GEQ 1 GOTO Error

rm COLMAP-dev-windows.zip

choco install vcredist-all -y
if %ERRORLEVEL% GEQ 1 GOTO Error

REM make GPU timeout larger so that it doesn't crash the driver under load
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers /v TdrLevel /t REG_DWORD /d 00000001
if %ERRORLEVEL% GEQ 1 GOTO Error

reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers /v TdrDelay /t REG_DWORD /d 00000120
if %ERRORLEVEL% GEQ 1 GOTO Error

if %ERRORLEVEL% EQU 0 GOTO Success

:Error
echo "An error occurred, exiting."
GOTO Finally

:Success
echo "Setup was successful. You should reboot the machine, then configure your AWS CLI to allow access to the ar.dataset.wrld3d bucket"
GOTO Finally

:Finally
exit /b %ERRORLEVEL%
