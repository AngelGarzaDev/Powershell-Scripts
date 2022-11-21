Remove-Item -Path "HKCU:\Network\Z" -Force -Verbose -ErrorAction SilentlyContinue


Remove-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2\##192.168.10.22#Users#$env:UserName" -Force -Verbose -ErrorAction SilentlyContinue
