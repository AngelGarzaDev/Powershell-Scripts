If ((Get-SMBMapping).LocalPath -eq 'Z:')
{
Remove-SMBMapping -LocalPath Z: -Force
}
