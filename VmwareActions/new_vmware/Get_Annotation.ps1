Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$CustomAttribute = $args[3]
$InventoryItem = $args[4]


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Get-Annotation -CustomAttribute $CustomAttribute -Entity $InventoryItem

Disconnect-VIServer -Server $vc -Confirm:$false

