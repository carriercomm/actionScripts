Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$Address = $args[3]
$Type = $args[4]


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Get-IScsiHbaTarget -Address $Address -Type $Type

Disconnect-VIServer -Server $vc -Confirm:$false