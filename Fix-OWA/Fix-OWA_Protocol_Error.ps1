#need to be connected to 365.ps1

$mailbox = Read-Host "EMAIL: "

Write-Host "DISABLING..."
Get-CasMailbox $mailbox

Set-CASMailbox $mailbox -EwsAllowMacOutlook $False
Set-CASMailbox $mailbox -ImapEnabled $False
Set-CASMailbox $mailbox -PopEnabled $False
Set-CASMailbox $mailbox -EwsEnabled $False
Set-CASMailbox $mailbox -EwsAllowOutlook $False
Set-CASMailbox $mailbox -EwsAllowEntourage $False
Set-CASMailbox $mailbox -MAPIEnabled $False
Set-CASMailbox $mailbox -ActiveSyncEnabled $False
Set-CASMailbox $mailbox -OWAEnabled $False

Write-Host "ENABLING..."
Get-CasMailbox $mailbox

Set-CASMailbox $mailbox -EwsAllowMacOutlook $True
Set-CASMailbox $mailbox -ImapEnabled $True
Set-CASMailbox $mailbox -PopEnabled $True
Set-CASMailbox $mailbox -EwsEnabled $True
Set-CASMailbox $mailbox -EwsAllowOutlook $True
Set-CASMailbox $mailbox -EwsAllowEntourage $True
Set-CASMailbox $mailbox -MAPIEnabled $True
Set-CASMailbox $mailbox -ActiveSyncEnabled $True
Set-CASMailbox $mailbox -OWAEnabled $True