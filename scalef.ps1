# changes all video files in dir to same width, height
param($dirPath, $width, $height)
$paths = [System.Collections.Generic.List[string]]@()
$count = 0
$widths = [System.Collections.Generic.List[string]]@()

Get-ChildItem -Path $dirPath | Foreach-Object {
    $paths.Add($_.FullName)
}

foreach($path in $paths) {
    ffmpeg -i $path -vf scale="$width":"$height" -c:a copy ("$count" + "output.mp4")
    $count+=1

}