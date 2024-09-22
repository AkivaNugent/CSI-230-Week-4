﻿#Q5/6
Get-Content C:\xampp\apache\logs\access.log | Select-String ' 200 ' -NotMatch |Select-Object -last 5

#Q7
$A = Get-ChildItem -Path C:\xampp\apache\logs\*.log | Select-String -AllMatches 'error'
$A[-5..-1]

#Q8

$notfounds = Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 '

$regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"

$ipsUnorganized = $regex.Matches($notfounds)

$ips = @()
for ($i=0; $i -lt $ipsUnorganized.Count; $i++){
    $ips += [pscustomobject ]@{ "IP" = $ipsUnorganized[$i].value;}
    }

#Q9
$ipsoftens = $ips | Where-Object { $_.IP -ilike "10.*"}
$counts = $ipsoftens | Group IP
$counts | Select-Object Count, Name