Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$Cluster  = $args[3]
$Name = $args[4]

$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Get-DrsRule -Cluster $Cluster -Name $Name

Disconnect-VIServer -Server $vc -Confirm:$false
