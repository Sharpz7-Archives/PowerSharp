$array = git branch

foreach ($num in 1..$array.length) {
    Write-Host "Option $num -- " -NoNewLine
    $array[$num-1]
}

$key = Read-Host -Prompt "Which branch do you want to archive?"

$name = $array[$key-1].substring(2)

git tag archive/$name $name
"Branch was archived"

git branch -d $name
"Branch was deleted"