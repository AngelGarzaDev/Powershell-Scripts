#
#
#Set the following variables according to what is needed
$groupname="IT Test Dynamic Distribution Group4"
$filter="(Title -eq 'Service Desk Technician') -or (Title -eq 'I.T. Infrastructure Administrator') -and (ExchangeUserAccountControl -ne 'AccountDisabled')"
#
#
New-DynamicDistributionGroup -Name "$groupname" -RecipientFilter "$filter"