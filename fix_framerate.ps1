# change framerate of an input file

param ($input_file, $fps, $output_file)
$fps = 30
Start-Process -FilePath "ffmpeg.exe" -ArgumentList "-i `"$input_file`"", "-vf `"fps=$fps`"", "-c:v libx264 -preset fast -crf 23", "`"$output_file`"" -NoNewWindow -Wait
