(user.jobTitle -contains "Data") or (user.jobTitle -contains "Intelligence") or ((user.jobTitle -contains "Service Desk Technician") and (user.city -eq "Selma") and (user.accountEnabled -eq true))


(user.jobTitle -contains "Data") or (user.jobTitle -contains "Intelligence") and (user.accountEnabled -eq true)



or ((user.jobTitle -contains "Service Desk Technician") and (user.city -eq "Selma") and (user.accountEnabled -eq true))