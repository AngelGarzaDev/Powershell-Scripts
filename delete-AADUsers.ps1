Import-Csv .\exportUsers_2023-5-16.csv | ForEach-Object {
    Remove-AzureADUser  -ObjectId  "$($_.userPrincipalName)"
    #New-AzureADUser -DisplayName "$($_.Name)" -UserPrincipalName $($_.UPN) -UsageLocation US -PasswordProfile $PasswordProfile -AccountEnabled $true -MailNickName $($_.Name)
}