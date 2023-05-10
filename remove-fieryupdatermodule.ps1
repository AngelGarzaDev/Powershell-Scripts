#
#This script will delete the registry key responsible for running the Fiery Updater Module
#
$registrykey = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run'

if ( $registrykey -match 'FPDU' )
{
    Remove-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run' -Name 'FPDU'
}
