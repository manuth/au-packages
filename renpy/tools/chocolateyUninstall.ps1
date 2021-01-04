Remove-Item $(Join-Path -Path $([System.Environment]::GetFolderPath("CommonStartMenu")) -ChildPath $([string]::Join([System.IO.Path]::DirectorySeparatorChar, @("Programs", "Ren'Py.lnk"))))
