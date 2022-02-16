cls

Import-Clixml  C:\powershell\customers.xml
$xml = [xml](Get-Content C:\powershell\customers.xml)

$rows = $xml.customers.customer
foreach ($row in $rows)
{
    if($row.country -eq 'poland'){
        $row.full_name
    }
}