#Run as current user, not Administrator

New-Item -Path "HKCU:\SOFTWARE\Microsoft\Office\16.0\Common\Identity" -Name "DisableAADWAM"
New-Item -Path "HKCU:\SOFTWARE\Microsoft\Office\16.0\Common\Identity" -Name "DisableADALatopWAMOverride"
New-Item -Path "HKCU:\SOFTWARE\Microsoft\Office\16.0\Common\Identity" -Name "EnableADAL"

New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Office\16.0\Common\Identity" -Name "DisableAADWAM" -Value 1 -PropertyType DWord
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Office\16.0\Common\Identity" -Name "DisableADALatopWAMOverride" -Value 1 -PropertyType DWord
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Office\16.0\Common\Identity" -Name "EnableADAL" -Value 1 -PropertyType DWord

