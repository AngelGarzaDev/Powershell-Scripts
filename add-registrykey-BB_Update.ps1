$ErrorActionPreference= 'silentlycontinue'

New-ItemProperty -Path "HKCU:\Software\Bluebeam Software\20\Revu" -Name "InAppUpdateVersionToSkip" -Value 20.2.90 -PropertyType String

Remove-ItemProperty -Path "HKCU:\Software\Bluebeam Software\20\Revu" -Name "InAppUpdatePostponed"