Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$vApp = $args[3]
$Destination = $args[4]


$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

Export-VApp -vApp $vApp -Destination $Destination -Force -CreateSeparateFolder:$false -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false
