# change framerate of an input file

param ($input_file, $fps, $output_file)
ffmpeg -i $input_file -vf "fps=`"$fps`"" -c:v libx264 -preset fast -crf 23 $output_file