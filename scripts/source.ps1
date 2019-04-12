param($loc)
$d = @{}
$array = Get-Content $loc

foreach ($item in $array) {
    $comment = $item.subString(0, 1)
    if (!($comment -eq "#")) {
        $name, $value = $item.split("=")
        $check = $value.subString(0, 1)
        if ($check -eq "(") {
            $length = $value.length
            $str = $value.subString(1, $length-2)
            $value = $str -split ", "
        }
        $d[$name] = $value
    }
}
return $d