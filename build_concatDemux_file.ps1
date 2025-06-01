#build .txt with this format needed for `concat.ps1` <https://trac.ffmpeg.org/wiki/Concatenate#demuxer>
param($concat_file, $dir) 

Get-ChildItem -Path $dir | ForEach-Object {
    $temp = $_.FullName
    Add-Content -Path $concat_file -Value "file  '$temp'"
}
