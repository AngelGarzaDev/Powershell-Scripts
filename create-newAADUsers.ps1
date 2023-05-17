$PasswordProfile=New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password="VRZ_agj4ufq2taw-zwu"


Import-Csv .\schmla-users.csv | ForEach-Object {
    Write-Host "$($_.Name), whose Email Address is $($_.UPN)."
    New-AzureADUser -DisplayName "$($_.Name)" -UserPrincipalName $($_.UPN) -UsageLocation US -PasswordProfile $PasswordProfile -AccountEnabled $true -MailNickName $($_.Name)
}