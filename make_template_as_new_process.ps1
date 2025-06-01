# where do you want to create template
param($dir_path, $root_name)

Start-Process -FilePath "powershell.exe" -ArgumentList "-File make_template.ps1 -dir_path `"$dir_path`" -root_name `"$root_name`"" -Wait -NoNewWindow