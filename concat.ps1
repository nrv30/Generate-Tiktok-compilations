# takes path to textfile which contains the files to be concatenated
# follow theses instructions to make your textfile <<https://trac.ffmpeg.org/wiki/Concatenate#demuxer>>
# or use script `build_concatDemux_file.ps1` to build it based for a directory of vids

param($inputFile, $outputFile)
ffmpeg -f concat -safe 0 -i $inputFile -c:v libx264 -preset fast -crf 23 $outputFile
