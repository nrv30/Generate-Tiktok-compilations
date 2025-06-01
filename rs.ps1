#takes all video files in a directory and changes their width to $width
param($dirPath, $width)
$paths = [System.Collections.Generic.List[string]]@()
$count = 0
$widths = [System.Collections.Generic.List[string]]@()

Get-ChildItem -Path $dirPath | Foreach-Object {
    $paths.Add($_.FullName)
    $count+=1
}

foreach($path in $paths) {
    $data = ffprobe -v error -select_streams v:0 -show_entries stream=width -of csv=p=0 $path
    $widths.Add($data)
}


for ($i = 1; $i -le $count; $i++) {
    $name = "rs_output" + $i + ".mp4"
    $width = $widths[$i-1]/3
    ffmpeg -i $paths[$i-1] -vf scale=$width -c:a copy $name
}
