"Do you want to install the custom terminal?"
"This will require a nerd font, which can be found here: https://nerdfonts.com"

$key = Read-Host -Prompt "Yes/No (Y/N)"

if ($key -like "y") {
    $weatherenv = "Y"
    "Installing the powershell profile..."
    $loc = $PSScriptRoot
    mkdir -p "$env:USERPROFILE\Documents\WindowsPowerShell" -Force > $null
    Copy-Item "$loc/terminal/Profile.ps1" -Destination "$env:USERPROFILE\Documents\WindowsPowerShell"
    "Adding weather app to PATH"

    $new = [Environment]::GetEnvironmentVariable("Path", "User")
    $new = $new.replace("$loc\external-code", "")
    if ($Path -ne "") {
        $new = $new + ";"
    }
    $add = $new + "$loc\external-code"
    [Environment]::SetEnvironmentVariable("Path", $add, "User")

    "Done! You can edit the Profile here: ($env:USERPROFILE\Documents\WindowsPowerShell)"
    "It is recommended to download a terminal emulator"
    "Here are some nice ones: https://hyper.is - https://cmder.net"
} else {
    "Skipping Profile Install"
}

Read-Host -Prompt "Press any key to continue..."

"Installing scripts..."
"Look at the README for more information on our scripts."

$loc = $PSScriptRoot
"Adding scripts to PATH"
$new = [Environment]::GetEnvironmentVariable("Path", "User")
$new = $new.replace(";$loc\scripts", "")
$add = $new + ";$loc\scripts"
[Environment]::SetEnvironmentVariable("Path", $add, "User")

net stop beep
"Removed annoying powershell 'beep'"

"DONE!"
"You will likely need to restart windows for everything to start working"