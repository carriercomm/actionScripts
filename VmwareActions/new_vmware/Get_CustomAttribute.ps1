Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$Name = $args[3]
$TargetType = $args[4]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Get-CustomAttribute -Name $Name -TargetType $TargetType

Disconnect-VIServer -Server $vc -Confirm:$false




