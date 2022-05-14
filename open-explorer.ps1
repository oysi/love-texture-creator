
$windows = (new-object -comobject shell.application).windows()

$window = $windows | where { $_.locationurl | findstr ("$env:appdata\LOVE\love-texture-creator" -replace "\\","/") }

if (-not($window)) {
	explorer "$env:appdata\LOVE\love-texture-creator\textures"
}
