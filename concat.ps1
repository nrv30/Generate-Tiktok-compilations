# takes path to textfile which contains the files to be concatenated
# follow theses instructions to make your textfile <<https://trac.ffmpeg.org/wiki/Concatenate#demuxer>>

param($inputFile, $outputFile)
ffmpeg -f concat -safe 0 -i $inputFile -c:v libx264 -preset fast -crf 23 $outputFile
