# call fix_framerate on every file in a directory
param($script_path, $dir)

Get-ChildItem -Path $dir | ForEach-Object {
    $count++
    Invoke-Command -ScriptBlock { 

    & $script_path -input_file $_.FullName -output_file "$count.mp4"
} -ArgumentList $_.FullName, "$count.mp4"

}