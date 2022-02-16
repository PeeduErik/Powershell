cls
hostname
 
$ADArvutid = (Get-ADComputer -filter *).name
$ADArvutid

$kettad = (Get-PSDrive -PSProvider FileSystem).name

foreach($ketas in $kettad){
   Write-Host "Ketta tähistamiseks on $ketas"
    $vabaruum = [math]::Round(((Get-Volume -DriveLetter $ketas | Measure-Object -Property sizeremaining -sum).Sum/1gb),2)
    $kogumaht = [math]::Round(((Get-Volume -DriveLetter $ketas).Size/1gb),2)
    $protsent = [math]::Round(($vabaruum/$kogumaht*100),2)
    $50=50
        if($protsent -lt 50){
            Write-Host "ketas $ketas hakkab täis saama, täituvus on $protsent %"
            }
            else
            {
            Write-Host "ketta $ketas täituvus on $protsent %"
            }
        }