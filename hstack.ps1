#takes 3 video files by command line args and creats hstack out of them
#---ffmpeg -i input0 -i input1 -filter_complex "[0]pad=iw+5:color=black[left];[left][1]hstack=inputs=2" output---

#resize from middle 1/4: ffmpeg -i output6.mp4 -vf "crop=640:in_h:650:0" cropped_video3.mp4
$durations = [System.Collections.Generic.List[int]]@()
$paths = [System.Collections.Generic.List[string]]@()
for ($i = 1; $i -le 3; $i++) {
    $data = ffprobe -v error -select_streams v:0 -show_entries format=duration -of csv=p=0 $args[$i-1]
    $durations.Add($data)
    $paths.Add($args[$i-1])
}

$longest = 0 #stores index of the largest in value in array
for ($i = 1; $i -le 3; $i++) {
    if ($durations[$i] -gt $durations[$longest]) {
        $longest = $i
    }
}

if ($longest -ne 2) {
    $temp = $paths[2]
    $paths[2] = $paths[$longest]
    $paths[$longest] = $temp
}


ffmpeg -stream_loop -1 -t $durations[$longest] -i $paths[0] -stream_loop -1 -t $durations[$longest] -i $paths[1] -i $paths[2] -filter_complex "[0:v][1:v][2:v]hstack=inputs=3" $args[3]
