param($video, $music, $name)
& ffmpeg -i $video -i $music -c:v copy -map 0:v:0 -map 1:a:0 -shortest $name