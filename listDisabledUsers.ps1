Connect-Entra -Scopes 'User.ReadWrite.All'
Get-EntraUser -Filter "accountEnabled eq false" | Select-Object DisplayName, Id, Mail, UserPrincipalName