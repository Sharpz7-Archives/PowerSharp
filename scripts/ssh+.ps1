$dir = (get-item $PSScriptRoot).parent.FullName
$d = source "$dir/data/ssh.env"

foreach ($item in $d.keys) {
	$ip =$d[$item][0]
	"$item - $ip"
}

""
$key = Read-Host -Prompt "Which server?"

if ($d.ContainsKey($key)) {
	$ssh = $d[$key]
	if ($ssh[0] -eq "") {
		"That is not a valid hostname!"
	}

	if ($ssh[1] -eq $null) {
		ssh $ssh[0]
	}

	elseif ($ssh[2] -eq $null) {
		ssh $ssh[0] -p $ssh[1]
	}

	else {
		ssh $ssh[0] -p $ssh[1] -i $ssh[2]
	}

}

else {
	"That was not a valid key! Please try again"
}