param($inputFile, $outputFile)
ffmpeg -f concat -safe 0 -i $inputFile -c:v libx264 -preset fast -crf 23 $outputFile
