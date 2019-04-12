cd $PSScriptRoot
cd ..
$d = source "data/ssh.env"

foreach ($item in $d.keys) {
	$ip =$d[$item][0]
	"$item - $ip"
}

""
$key = Read-Host -Prompt "Which server?"

if ($d.ContainsKey($key)) {
	$ssh = $d[$key]
	ssh $ssh[0] -p $ssh[1] -i $ssh[2]
}

else {
	"That was not a valid key! Please try again"
}