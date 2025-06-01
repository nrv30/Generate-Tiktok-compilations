param($input_file, $output_name)
& ffmpeg -i $input_file -vf hflip $output_name