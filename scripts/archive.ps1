git branch

$key = Read-Host -Prompt "what branch do you want to archive?"

git tag archive/$key $key
"branch was archived"

git branch -d $key
"branch was deleted"