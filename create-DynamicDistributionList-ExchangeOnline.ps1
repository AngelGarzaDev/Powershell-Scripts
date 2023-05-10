#
#
#Set the following variables according to what is needed
$groupname="Estimating Reporting"
$filter="(CustomAttribute1 -eq 'Estimating') -or (CustomAttribute1 -eq 'Estimating 1') -or (CustomAttribute1 -eq 'Estimating 2') -or (CustomAttribute1 -eq 'Estimating 3') -or (CustomAttribute1 -eq 'Estimating 4') -or (CustomAttribute1 -eq 'Assistant Estimator') -or (CustomAttribute1 -eq 'Chief Estimator') -or (CustomAttribute1 -eq 'Estimating Advisor') -or (CustomAttribute1 -eq 'Estimating Services Support') -or (CustomAttribute1 -eq 'Estimating Svc Support') -or (CustomAttribute1 -eq 'Preconstruction') -or (CustomAttribute1 -eq 'V.P. Estimating') -or (CustomAttribute1 -eq 'Preconstruction Services Manager') -and (ExchangeUserAccountControl -ne 'AccountDisabled')"
#
#
New-DynamicDistributionGroup -Name "$groupname" -RecipientFilter "$filter"


