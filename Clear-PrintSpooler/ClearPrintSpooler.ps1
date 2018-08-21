Stop-Service -Name Spooler -Force
Move-Item -Path "$env:SystemRoot\System32\spool\PRINTERS\*.*" -Destination 'C:\demo\new' -Force
Remove-Item -Path "$env:SystemRoot\System32\spool\PRINTERS\*.*"
Start-Service -Name Spooler