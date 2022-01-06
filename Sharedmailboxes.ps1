#Connect-ExchangeOnline
Get-Mailbox -Filter {recipienttypedetails -eq "SharedMailbox"} | Select-Object ExternalDirectoryObjectId| ForEach-Object { 
        Get-MailboxPermission $_.ExternalDirectoryObjectId
    } | Select-Object Identity, User, AccessRights | ft -Wrap -AutoSize | Out-File .\exportsharedmb.txt