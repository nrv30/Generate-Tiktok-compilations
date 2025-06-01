#takes all video files in a directory and decreases their width by 1/3
param($dirPath)
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

# ffmpeg -i $paths[0] -vf scale=widths[0]/3:-1 -c:a copy $name