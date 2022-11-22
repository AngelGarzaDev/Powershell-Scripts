if (Get-Module -ListAvailable -Name ExchangeOnlineManagement)
{
    Write-Host "Exchange Online Module is Installed"
}
else 
{
    Write-Host "Module is NOT Installed"
}
Start-Sleep -Seconds 10