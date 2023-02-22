#Run script as current user, not as Admin


$ErrorActionPreference = "Stop"

#force close teams
stop-process -name teams -force -erroraction silentlycontinue

#force close outlook
stop-process -name outlook -force -erroraction silentlycontinue

#Pause 1 second before running next command
Start-Sleep -Seconds 1

#Delete all contents in Teams cache directory
remove-item ~\AppData\Local\Microsoft\Outlook* -Recurse -ErrorAction SilentlyContinue
Start-Sleep -Seconds 1

#Start-process -File ~\AppData\Local\Microsoft\Teams\Update.exe -ArgumentList '--processStart "Teams.exe"'


