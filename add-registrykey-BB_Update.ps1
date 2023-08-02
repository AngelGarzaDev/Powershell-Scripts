$ErrorActionPreference= 'silentlycontinue'

New-ItemProperty -Path "HKCU:\Software\Bluebeam Software\20\Revu" -Name "InAppUpdateVersionToSkip" -Value 20.3.15 -PropertyType String

Remove-ItemProperty -Path "HKCU:\Software\Bluebeam Software\20\Revu" -Name "InAppUpdatePostponed"