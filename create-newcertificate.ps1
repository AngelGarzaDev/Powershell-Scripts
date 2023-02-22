# Create certificate
$mycert = New-SelfSignedCertificate -DnsName "spawglass.com" -CertStoreLocation "cert:\CurrentUser\My" -NotAfter (Get-Date).AddYears(1) -KeySpec KeyExchange

# Export certificate to .pfx file
$mycert | Export-PfxCertificate -FilePath mycert.pfx -Password (Get-Credential).password

# Export certificate to .cer file
$mycert | Export-Certificate -FilePath mycert.cer