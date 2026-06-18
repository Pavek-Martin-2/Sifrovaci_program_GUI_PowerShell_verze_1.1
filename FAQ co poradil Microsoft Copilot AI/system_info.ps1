cls

$pole_autoruv_pocitac_info = @(
"informace z pocitace na kterem byl program vytvoren:"
""
"Name                           Value"
"----                           -----"
"PSVersion                      5.1.19041.3570"
"PSEdition                      Desktop"
"PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}"
"BuildVersion                   10.0.19041.3570"
"CLRVersion                     4.0.30319.42000"
"WSManStackVersion              3.0"
"PSRemotingProtocolVersion      2.3"
"SerializationVersion           1.1.0.1"
""
"------- verze .NET Framework -------"
"hodnota nalezena v registru je : 533325"
"v tomto pocitaci je nainstalovana verze .NET Framework verze 4.8.1 a nebo vyssi"
)

for ( $i=0; $i -le $pole_autoruv_pocitac_info.Length -1; $i++ ) { Write-Host -ForegroundColor cyan $pole_autoruv_pocitac_info[$i] }

###############################################################################################################################
echo ""
echo "a stejne informace o verzich z vaseho pocitace jsou pro porovnani zde"
echo $PSVersionTable # jakak verze Power Shellu je v pocitaci
#echo $PSVersionTable.PSVersion
#echo $PSVersionTable.BuildVersion

echo ""
echo "------- verze .NET Framework -------" # vytahne obsah klice z registru a zvjisti verzi .NET Framework v pocitaci
# zjisteni verze .NET Framework nainstalovane v pocitaci

$release = Get-ItemPropertyValue -LiteralPath 'HKLM:SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full' -Name Release

switch ($release) {
    { $_ -ge 533320 } { $version = '4.8.1 a nebo vyssi'; break }
    { $_ -ge 528040 } { $version = '4.8'; break }
    { $_ -ge 461808 } { $version = '4.7.2'; break }
    { $_ -ge 461308 } { $version = '4.7.1'; break }
    { $_ -ge 460798 } { $version = '4.7'; break }
    { $_ -ge 394802 } { $version = '4.6.2'; break }
    { $_ -ge 394254 } { $version = '4.6.1'; break }
    { $_ -ge 393295 } { $version = '4.6'; break }
    { $_ -ge 379893 } { $version = '4.5.2'; break }
    { $_ -ge 378675 } { $version = '4.5.1'; break }
    { $_ -ge 378389 } { $version = '4.5'; break }
    default { $version = $null; break }
}

#$version = '4.4' # testovaci radek
#$version = $null # tastovaci radek 2

if ($version) {
echo "hodnota nalezena v registru je : $release"
echo "v tomto pocitaci je nainstalovana verze .NET Framework verze $version"
}else{
#Write-Host -Object '.NET Framework Version 4.5 or later is not detected.'
echo "nanalezl jsem instalaci .NET Framework verze 4.5 a nebo vyssi"
}

echo ""
Write-Host -ForegroundColor red 'prohlednete si prosim take screenshoty z adresare  - "FAQ co poradil Microsoft Copilot AI"'
echo ""

Read-Host -Prompt "Press ENTER to exit"
sleep 1
