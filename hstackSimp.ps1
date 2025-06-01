param($paths1, $paths2, $paths3, $name)
& ffmpeg -i $paths1 -i $paths2 -i $paths3 -filter_complex "[0:v][1:v][2:v]hstack=inputs=3:shortest=1" -shortest $name
