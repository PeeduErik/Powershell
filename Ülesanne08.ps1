#Peedu Erik Pajo
#IT21
#07.02.2022

cls
Function raadius{
    <#
    .SYNOPSIS
        Kirjuta siia raadius.
    .DESCRIPTION
        Kirjuta siia raaadius cm ja see muudetakse pindalaks.
    .EXAMPLE
    Kui paned raadiuse nr 2 siis saad vastuseks 12.57
    #>
        param
        (
        [Parameter(Mandatory=$true, HelpMessage='lisa siia ringi raadius')]
        $raadius
        )
        [Math]::Round([math]::PI*[Math]::Pow($raadius,2),2)

        "Pindala on $raadius"
}
raadius

function täisnimi{
    <#
    .SYNOPSIS
        Kirjuta siia oma nimi.
    .DESCRIPTION
        Kirjuta siia oma nimi täpi tähtedega ja see muudab need täpi tähtedest tavalisteks.
    .EXAMPLE
        öö=oo

    #>
        param
            (
            [Parameter(Mandatory=$true, HelpMessage='Lisa siia oma täisnimi')]
            $nimi2
            )
            $nimi=$nimi2 -replace "\s+"," "
                $asenda = $nimi.Replace("ü","u").Replace("ö","o").Replace("õ","o").Replace("ä","a")
                (Get-Culture).TextInfo.ToTitleCase($asenda.tolower())
}
täisnimi

