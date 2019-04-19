$branchSymbol = [char]0xE0A0;
$folderSymbol = [char]0xe5fe;
$compassSymbol = [char]0xf68a;
$divideSymbol = [char]0xe0d4;
$arrowSymbol = [char]0xe0b0;

function Prompt {
    $path = Split-Path (Get-Location) -Leaf

    Write-Host " $compassSymbol root@Sharp " -ForegroundColor "Yellow" -NoNewline
    Write-Host "$divideSymbol" -ForegroundColor "Blue" -NoNewline
    Write-Host " $folderSymbol ~/$path " -ForegroundColor "White" -BackgroundColor "Blue" -NoNewline

    $data = git branch
    if ($data) {
        Write-Host "$arrowSymbol" -ForegroundColor "Blue" -BackgroundColor "Green" -NoNewline
    }
    else {
        Write-Host "$arrowSymbol" -ForegroundColor "Blue" -NoNewline
    }
    foreach ($line in $data) {
        if ($line.Contains('*')) {
            $final = $line.substring(2)
            Write-Host " $branchSymbol $final" -ForegroundColor "DarkGray" -BackgroundColor "Green" -NoNewline
            Write-Host "$arrowSymbol" -ForegroundColor "Green" -NoNewline

        }
    }

    return " "
}

cls
Write-Host $(weather -City Inverness -Country UK)
$Host.UI.RawUI.WindowTitle = (Get-Date -UFormat '%d/%m/%y - SharpBox').Tostring()


