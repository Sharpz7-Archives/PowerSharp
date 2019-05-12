"Welcome to Blackjack!"
"Created by Sharp"
""
Read-Host -Prompt "Press enter to continue"
""

$cards = @("A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K")
$no_ace = @(2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K")
$usercards = @()
$facecards = @("J", "Q", "K")
$ace = "A"

function pick_card  {
    $card = $cards[(Get-Random -Maximum $cards.count)]
    if ($usercards -contains $card) {
        $card = $no_ace[(Get-Random -Maximum $no_ace.count)]
    }
    return $card
}

function display($totals) {
    if ($totals -is [array]) {
        $total1, $total2 = $totals

        $output = "$total1 or $total2"
        if (($total1 -gt 21) -and ($total2 -gt 21)) {
            $output = 0
        }
    }
    else {
        $output = $totals
        if ($output -gt 21) {
            $output = 0
        }
    }
    return $output
}

function sum($cards, $show) {
    if ($cards -contains $ace) {
        $total1 = 1
        $total2 = 11

        ForEach ($card in $cards) {
            if ($facecards -contains $card) {
                $total1 += 10
                $total2 += 10
            }
            elseif ($card -eq $ace) {}
            else {
                $total1 += $card
                $total2 += $card
            }
        }
        $total = @($total1, $total2)
    }

    else {
        $total = 0
        ForEach ($card in $cards) {
            if ($facecards -contains $card) {
                $total += 10
            }
            else {
                $total += $card
            }

        }

    }

    if ($show -eq "display") {
        $output = display $total
        return $output
    }
    else {
        if ($total -is [array]) {
            $total1, $total2 = $total
            if ($total1 -gt $total2) {
                if ($total1 -lt 21) {
                    return $total1
                }
                else {
                    return $total2
                }

            }
            else {
                if ($total2 -lt 21) {
                    return $total2
                }
                else {
                    return $total1
                }
            }
        }
        else {
            return $total
        }
    }
}

function cpu {
    $cpucards = @()
    $choosing = 1
    While ($choosing -eq 1) {
        $card = pick_card
        $cpucards += $card
        $total = sum $cpucards
        if ($total -gt 15) {
            $choosing = 0
        }
        if ($total -gt 21) {
            ""
            Write-Host "CPU loses! ($total)"
            "Good job!"
            exit
        }
    }
    $total = sum $cpucards
    return $total
}

$choosing = "t"
While ($choosing -eq "t") {
    $card = pick_card
    $usercards += $card
    $total = sum $usercards "display"
    Write-Host "Here is your cards: $usercards"

    if ($total -eq 0) {
        ""
        $f_total = sum $usercards
        Write-Host "You lose! You are over 21! ($f_total)"
        exit
    }

    Write-Host "Total: $total"
    $choosing = Read-Host -Prompt "Stick or Twist? (t/s)"
}

$f_total = sum $usercards
$cpu_total = cpu
""
if ($cpu_total -gt $f_total) {
    Write-Host "CPU Wins!"
}
else {
    Write-Host "Player Wins!"
}
"Player Total: $f_total"
"CPU Total: $cpu_total"



