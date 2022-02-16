cls

$csv_header =@("name;username;email;password")
$csv_header | Set-Content $dir\emails.csv
$users = Import-Csv $dir\users.csv
$kasutajad = Import-Csv $dir\users.csv

foreach($kasutaja in $kasutajad){

    $enimi = $kasutaja.first_name
    $pnimi = $kasutaja.first_name
    $kasutajanimi = $enimi[0]+$pnimi
    $lower = $kasutajanimi.tolower()
    $email = ($enimi+"."+$pnimi).ToLower()+
"@hkhk.edu.ee"

    $pass = 1..3 | ForEach-Object { Get-Random -Maximum $pnimi.length}
    $pass = -join $pnimi[$pass]
    $pass += Get-Random -Maximum 10
    $pass += Get-Random -Maximum 10

    $row = $enimi +""+ $pnimi +":"+ $lower +":"+$email+":"+$pass
    Add-Content $dir\emails.csv $row

    }