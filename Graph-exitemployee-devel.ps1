#This script will remove all Licenses and Azure Group Memberships for a single user.



#Check to ensure script is running on Powershell version 7 or greater.
$ErrorActionPreference = "Stop"

If (($PSVersionTable).PSVersion -lt '7.0')
{
    Write-Host "`nThis script is only compatible with Powershell version 7 and greater."
    Start-Sleep -Seconds 10
    Exit
}


##############################################################################################
#Check for Exchange Online and Microsoft Graph
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


########################################################################################
Write-Host "`nConnecting to Exchange."
Connect-ExchangeOnline -ShowBanner:$false
Write-Host "`nConnecting to Microsoft Graph."
Connect-Graph -Scopes User.ReadWrite.All, Organization.Read.All, MailboxSettings.ReadWrite, GroupMember.ReadWrite.All, Directory.ReadWrite.All, Group.ReadWrite.All | Out-Null


############################################################################################
#This section of the script sets some of the necessary Aliases to be used later
#Enter the User's email. Do not enter an email alias
$user = Read-Host "`nEnter the Exit Employee's Email"
#Create Alias to the User's Name
$name = get-mguser -userid $user | Select-Object -ExpandProperty Displayname
#Create Alias for the User's Manger (UPN)
$manager = Read-Host "Manager's email to be used for Auto Reply"
#Create Alias for the Manager's name
$managerName = get-mguser -userid $manager | Select-Object -ExpandProperty Displayname
#Create Alias to the User's Object ID
$userObjectId = get-mguser -userid $user | Select-Object -ExpandProperty Id
#Create Alias to the User's current Licence(s)
$licensesToRemove = Get-MgUserLicenseDetail -UserId $User | Select-Object -ExpandProperty SkuId
#Create Alias to the User's current Group Membership
$groupsToRemove = Get-MgUserMemberOf -UserId $user | Select-Object -ExpandProperty "Id"
#Create Alias for the Organization's name. To be used in auto reply email.
$orgName = get-mgorganization | select-object -ExpandProperty "DisplayName"


###################################################################################
#This part of the script uses ExchangeOnline to set Auto Reply email, and converts to Shared mailbox
#
Write-Host 'Setting Auto Reply Message'
Set-MailboxAutoReplyConfiguration -Identity $user -AutoreplyState Enabled -InternalMessage "Hello, $name is no longer with $orgName. Please contact $managerName at $manager" -ExternalMessage "Hello, $name is no longer with $orgName. Please contact $managerName at $manager"
Write-Host 'Setting mailbox as shared'
Set-Mailbox -Identity $user -Type Shared


#####################################################################################
#Remove Licenses
Write-Host "Removing licenses: $licensesToRemove"
foreach ($license in $licensesToRemove)
{
    Set-MgUserLicense -UserId $user -RemoveLicenses $license -AddLicenses @() -erroraction 'silentlycontinue'
}

#Remove Group Membership
foreach ($group in $groupsToRemove)
{
    Remove-MgGroupMemberByRef -GroupId $group -DirectoryObjectId $userObjectId -erroraction 'silentlycontinue'
    $removinggroup = Get-MgGroup -GroupId $group | Select-Object -ExpandProperty "DisplayName"
    Write-Host "Removing group: $removinggroup"
}


####################################################################################
Write-Host "Disconnecting from Tenant"
Disconnect-ExchangeOnline -Confirm:$false; Disconnect-Graph | Out-Null
Read-Host -Prompt "Press Enter to exit"