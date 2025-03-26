Connect-Entra -Scopes 'User.Read.All'

$allUsers = Get-EntraUser -All

$usersWithoutManagers = foreach ($user in $allUsers) {
    $manager = Get-EntraUserManager -UserId $user.Id -ErrorAction SilentlyContinue
    if (-not $manager) {
        [PSCustomObject]@{
        Id = $user.ID
        DisplayName = $user.DisplayName
        UserPrincipalName = $user.UserPrincipalName
        }
    }
}

$usersWithoutManagers | Format-Table Id, DisplayName, UserPrincipalName