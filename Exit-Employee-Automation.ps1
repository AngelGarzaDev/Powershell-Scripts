Connect-ExchangeOnline
$Name = Read-Host "Please enter the user's name"
$Email = Read-Host "Please enter the exit employee's email address"
$Manager = Read-Host "please enter the supervisor's name"
$ManagerEmail = Read-host "please enter the supoervisor's email"
$ErrorActionPreference = "Stop"
Set-MailboxAutoReplyConfiguration -Identity $Email -AutoreplyState Enabled -InternalMessage "Hello, $Name is no longer with SpawGlass. Please contact $Manager at $ManagerEmail" -ExternalMessage "Hello, $Name is no longer with SpawGlass. Please contact $Manager at $ManagerEmail"
Set-Mailbox -Identity $Email -Type Shared
Get-EXOMailboxStatistics $Email