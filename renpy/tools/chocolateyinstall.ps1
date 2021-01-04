$ErrorActionPreference = 'Stop';
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition;

$archiveArgs = @{
  packageName   = 'renpy'
  url           = 'https://www.renpy.org/dl/7.3.5/renpy-7.3.5-sdk.7z.exe'
  checksum      = '3f2760be6c8b36698308470947783b1f5ce7ebcb4e2ae6bf2761212f5c925823'
  checksumType  = 'sha256'
  unzipLocation = $toolsPath
};

# The renpy installer is a `7z`-package wrapped in a self extracting archive.
# Cause of the architecture of such an sfx archive, these files safely can be unzipped using 7-zip
Install-ChocolateyZipPackage @archiveArgs;

# ShimGen will add an executable file to `PATH` for each `.exe`-file in this package.
# This step ensures that all unnecessary executables are ignored by adding a `{ExeFileName}.ignore` file.
$exeFiles = Get-ChildItem $toolsPath -Recurse -Filter *.exe;

$mainEntryPoint = $(Get-ChildItem $(Join-Path $toolsPath "renpy*/renpy.exe")).FullName;

$entryPoints = @(
  $mainEntryPoint);

foreach ($exeFile in $exeFiles) {
  $ignoreFileName = "$($exeFile.FullName).ignore";

  if (
    -not $entryPoints.Contains($exeFile.FullName) -and
    -not $(Test-Path $ignoreFileName)) {
      New-Item -ItemType File $ignoreFileName;
  }
}

Install-ChocolateyShortcut `
  -ShortcutFilePath $(Join-Path -Path $([System.Environment]::GetFolderPath("CommonStartMenu")) -ChildPath $([string]::Join([System.IO.Path]::DirectorySeparatorChar, @("Programs", "Ren'Py.lnk")))) `
  -TargetPath $mainEntryPoint;
