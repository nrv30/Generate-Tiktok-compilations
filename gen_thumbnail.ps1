# pass in a timestamp to extract the video frame from
# example 00:00:05
param($input_name, $frame_timestamp, $output_name)
& ffmpeg -i "$input_name" -ss "$frame_timestamp" -vframes 1 "$output_name"