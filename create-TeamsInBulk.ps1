
Connect-MicrosoftTeams

$teams = import-csv c:\Temp\Teams.csv

Foreach($team in $teams)
{
New-Team -DisplayName $team.TeamName -Owner $team.Owner -Visibility $team.Visibility -MailNickName $team.TeamName
}