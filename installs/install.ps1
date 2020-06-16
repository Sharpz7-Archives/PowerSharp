"Installing the powershell profile..."

$loc = $PSScriptRoot
$scriptsLoc = "$loc\scripts"
$powersharpLoc = "$loc\powersharp.ps1"

$profileDir = "$env:USERPROFILE\Documents\WindowsPowerShell"

mkdir -p $profileDir -Force > $null
Copy-Item "$powersharpLoc" -Destination $profileDir


"Adding everything to PATH..."
$old = [Environment]::GetEnvironmentVariable("Path", "User")
$new = "$scriptsLoc;$old"
[Environment]::SetEnvironmentVariable("Path", $new, "User")

"DONE!"
"You will likely need to restart windows for everything to start working"