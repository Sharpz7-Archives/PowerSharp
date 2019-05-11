"Do you want to install the custom terminal?"
"This will require a nerd font, which can be found here: https://nerdfonts.com"

$key = Read-Host -Prompt "Yes/No (Y/N)"
$weather_path = 0

if ($key -like "y") {
    "Installing the powershell profile..."
    $loc = $PSScriptRoot
    mkdir -p "$env:USERPROFILE\Documents\WindowsPowerShell" -Force > $null
    Copy-Item "$loc/terminal/Profile.ps1" -Destination "$env:USERPROFILE\Documents\WindowsPowerShell"

    "Done! You can edit the Profile here: ($env:USERPROFILE\Documents\WindowsPowerShell)"
    "It is recommended to download a terminal emulator"
    "Here are some nice ones: https://hyper.is - https://cmder.net"
} else {
    "Skipping Profile Install"
}

Read-Host -Prompt "Press any key to continue..."

"Installing scripts..."
"Look at the README for more information on our scripts."

"Adding everything to PATH..."

$loc = $PSScriptRoot

$new = [Environment]::GetEnvironmentVariable("Path", "User")

if ($new -eq $null) {
    $new = ""
}

$new = $new.replace(";$loc\scripts", "")
$new = $new.replace("$loc\scripts", "")

if ($new -eq "") {
    $colon = ""
}
else {
    $colon = ";"
}

$new = $new + $colon + "$loc\scripts"


[Environment]::SetEnvironmentVariable("Path", $new, "User")

"DONE!"
"You will likely need to restart windows for everything to start working"