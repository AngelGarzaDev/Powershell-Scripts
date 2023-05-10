Send-MailMessage `
    -To "angel.garza@spawglass.com" `
    -From "han.solo@spawglass.com" `
    -Subject "This is a test message from PowerShell" `
    -Body "Hello World!" `
    -Credential (Get-Credential) `
    -SmtpServer "smtp.office365.com" `
    -Port 587 `
    -UseSsl    #If mail server not support SSL/TLS, let remove this parameter