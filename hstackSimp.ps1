param($paths1, $paths2, $paths3, $name)

# & ffmpeg -i $paths1 -r 30 -c:v libx264 -preset fast -crf 23 $name
# & ffmpeg -i $paths2 -r 30 -c:v libx264 -preset fast -crf 23 ("2" + $name) 
# & ffmpeg -i $paths3 -r 30 -c:v libx264 -preset fast -crf 23 ("3" + $name)

& ffmpeg -i $paths1 -i $paths2 -i $paths3 -filter_complex "[0:v][1:v][2:v]hstack=inputs=3:shortest=1" -shortest $name

# timestamp
# 00:40:00