if (Get-Module -ListAvailable ExchangeOnlineManagement)
{
    Write-Host "Exchange Online is Installed"
}
else {
    Install-Module -Name ExchangeOnlineManagement -Force
    Write-Host "Exchange Online has been Installed"
}


if (Get-Module -ListAvailable Microsoft.Graph)
{
    Write-Host "Microsoft Graph is Installed"
}
else {
    Install-Module -Name Microsoft.Graph -Force
    Write-Host "Microsoft Graph has been Installed"
}