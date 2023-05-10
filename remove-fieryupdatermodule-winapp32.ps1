#
#This script will delete the registry key responsible for running the Fiery Updater Module
#
Remove-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run' -Name 'FPDU'