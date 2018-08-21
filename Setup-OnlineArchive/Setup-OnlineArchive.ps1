Get-MailboxLocation –user <username> | fl mailboxGuid,mailboxLocationType
Start-ManagedFolderAssistant <mailboxID>
Get-MailboxFolderStatistics  -Identity <username> -archive | fl name, folderandsubfoldersize