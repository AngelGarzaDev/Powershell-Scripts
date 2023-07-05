# This Powershell Script will output the members in the specified Exchange dynamic distribution group

$group = Get-DynamicDistributionGroup -Identity all-supers@spawglass.com

Get-Recipient -RecipientPreviewFilter ($group.RecipientFilter) -OrganizationalUnit ($group.RecipientContainer) | Export-Csv -Path "C:\all-supers-membership.csv"
