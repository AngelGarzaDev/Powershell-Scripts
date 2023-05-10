$AllMailboxes = get-mailbox -resultsize unlimited

foreach ($mailbox in $AllMailboxes.ExternalDirectoryObjectId)
{
Get-EXOMailboxStatistics $mailbox -ErrorAction SilentlyContinue | Select-Object DisplayName, TotalItemSize, MailboxGuid | Add-Content C:\ps\mailboxes.csv
}
