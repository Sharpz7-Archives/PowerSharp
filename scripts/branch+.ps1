$array = git branch

foreach ($num in 1..$array.length) {
    Write-Host "Option $num -- " -NoNewLine
    $array[$num-1]
}

$key = Read-Host -Prompt "Choose your branch"

$name = $array[$key-1]

git checkout $name.substring(2)