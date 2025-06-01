# where do you want to create template
param($dir_path, $root_name)

function CheckError_comp {
    param($command)
    Invoke-Expression $command
if (!$?) {
     Write-Output "Failed"
     exit 1
 } 
}

function CheckError {
    if (!$?) {
     exit 1
 } 
}

set-location -Path $dir_path
CheckError
CheckError_comp "mkdir $root_name"
set-location "$root_name"
CheckError
CheckError_comp "mkdir center"
CheckError_comp "mkdir side"

