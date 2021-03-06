Add-PSSnapin -Name "VMWare.VimAutomation.Core"

$server_name = $args[0]
$username = $args[1]
$password = $args[2]
$Cluster = $args[3]




$vc = Connect-VIServer -Server $server_name -Protocol https -Username $username -Password $password

$drs = Get-DrsRecommendation -Cluster $Cluster

Apply-DrsRecommendation -DrsRecommendation $drs -RunAsync -Confirm:$false

Disconnect-VIServer -Server $vc -Confirm:$false