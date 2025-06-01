param($concat_file, $dir) 

Get-ChildItem -Path $dir | ForEach-Object {
    $temp = $_.FullName
    Add-Content -Path $concat_file -Value "file  '$temp'"
}
