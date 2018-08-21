#Set the DC to configure its time based on NIST's NTP Server

net stop w32time

w32tm /config /syncfromflags:manual /manualpeerlist:"time-a.nist.gov, time-b.nist.gov, time-c.nist.gov, time-d.nist.gov"

w32tm /config /reliable:yes

net start w32time


<#
Run this command from the computers on the domain
net time \\<SERVER> /set /y
#>