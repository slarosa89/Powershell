<#
This script is used to:
-download PSTools from SysInternals website
-extract it
-enable PSRemoting on a remote machine
-removes both the inial .zip and the extracted folder
-can be used on any domain provided that the user authenticates as an Admin/Domain Admin


ONE LINE WILL REQUIRE MANUALLY CHANGING INFORMATION:
Add-Type -assembly "system.io.compression.filesystem"; Invoke-WebRequest https://download.sysinternals.com/files/PSTools.zip -OutFile C:\PSTools.zip; [io.compression.zipfile]::ExtractToDirectory("C:\PSTools.zip", "C:\PSTools"); rm C:\PSTools.zip; C:\PSTools\psexec.exe \\<REMOTE_MACHINE> -u <DOMAIN>\<USERNAME> -p <PASSWORD> -h /accepteula powershell Enable-PSRemoting -Force; rm C:\PSTools -recurse
#>



$DOMAIN   = Read-Host -Prompt "DOMAIN: "
$USERNAME = Read-Host -Prompt "USERNAME: "
$PASSWORD = Read-Host -Prompt "PASSWORD: "
$COMPUTER = Read-Host -Prompt "COMPUTER: "

Add-Type -assembly "system.io.compression.filesystem"
Invoke-WebRequest https://download.sysinternals.com/files/PSTools.zip -OutFile C:\PSTools.zip
[io.compression.zipfile]::ExtractToDirectory("C:\PSTools.zip", "C:\PSTools"); rm C:\PSTools.zip
C:\PSTools\psexec.exe \\$COMPUTER -u $DOMAIN\$USERNAME -p $PASSWORD -h /accepteula powershell Enable-PSRemoting -Force
rm C:\PSTools -recurse