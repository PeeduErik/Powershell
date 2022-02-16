#Peedu Erik Pajo
#IT-21
#08.02.2022
cls$dir = "C:\POWERSHELL"


$users = Import-Csv $dir\kasutajad.csv

$parool = "Par00lA"

ForEach($user in $users){
    $fname = $user.Eesnimi
    $lname = $user.Perekonnanimi
    $osakond = $user.osakond.ToUpper()
    $OU = "OU=$osakond,OU=KASUTAJAD,DC=pajo,DC=local"
    $teekond = "OU=KASUTAJAD,DC=pajo,DC=local"

    $knimi = $fname.ToLower()+"."+$lname.ToLower()if (![adsi]::Exists("LDAP://$OU")){
       New-ADOrganizationalUnit -Name $osakond –Path $teekond
       Write-Host "Loodi uus OU $OU"
    }
    else
    {
        Write-Warning "$OU on juba olemas"
    }
 
 if (Get-ADUser -F { SamAccountname -eq $knimi }){
        Write-Warning "kasutaja nimega $knimi on juba olemas"
    }
    else
    {
        New-ADUser `
        -SamAccountName $knimi `
        -Name "$fname $lname" `
        -GivenName $fname `
        -Surname $lname `
        -Enabled $true `
        -Path $OU `
        -Department $osakond `
        -AccountPassword (ConvertTo-SecureString $parool -AsPlainText -Force) -ChangePasswordAtLogon $true

        Write-Output "Loodi kasutaja nimega $knimi"
    }

   
    $dir = "C:\POWERSHELL"
    $log | Set-Content $dir\kasutajate_loomine.log  

    }