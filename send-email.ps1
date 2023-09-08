Send-MailMessage `
    -To "angel.garza@spawglass.com" `
    -From "angel.garza.noreply@spawglass.com" `
    -Subject "This is a test message from PowerShell" `
    -Body "Hello World!" `
    -Credential (Get-Credential) `
    -SmtpServer 192.168.10.22 `
    -Port 25 `
    -UseSsl    #If mail server not support SSL/TLS, let remove this parameter