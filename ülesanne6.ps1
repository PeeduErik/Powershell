cls

$nimi = "Peedu Erik Pajo"
$email = "peeduerik@gmail.com"
Set-Variable =readonly
${kuu päev} = Get-Date -Format dd.MM.yyyy

Write-Host "Nimi" $nimi
"----------------------------"
Write-Host "Email" $email
"----------------------------"
Write-Host "Kuupäev" ${kuu päev}
"----------------------------"

#$skriptiAsukoht = $MyInvocation.MyCommand.Path
$dir = "C:\powershell"

$emailid = Get-Content -Path $dir\emailid.txt
$emailid.Split(",")
$emailid.Contains("@")
$emailid +=",$email"
$emailid[0,-1]

$kogus = ($emailid.split(",") | Measure-Object).Count

write-output "Massiivis on kokku $kogus"