taskkill /F /IM PrinterInstallerClientLauncher.exe
taskkill /F /IM PrinterInstallerClient.exe
taskkill /F /IM PrinterInstallerClientInterface.exe
taskkill /F /IM PrinterInstaller_MicrosoftMigrator.exe
net stop spooler
C:\windows\system32\msiexec.exe /qn /quiet /norestart /x {A9DE0858-9DDD-4E1B-B041-C2AA90DCBF74} REMOVE=ALL
Remove-Item "C:\Program Files (x86)\Printer Properties Pro\*.*" -Force -Confirm:$false
reg delete HKLM\SOFTWARE\PrinterLogic /f
reg delete HKLM\SOFTWARE\Wow6432Node\PPP /f
Remove-Item C:\windows\Temp\data -Recurse -Force -Confirm:$false
Remove-Item C:\windows\Temp\PPP -Recurse -Force -Confirm:$false
Remove-Item "C:\Program Files (x86)\Printer Properties Pro" -Recurse -Force -Confirm:$false
net start spooler