$ErrorActionPreference = 'Stop';
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition;

$archiveArgs = @{
  packageName   = 'renpy'
  url           = 'https://www.renpy.org/dl/7.3.5/renpy-7.3.5-sdk.7z.exe'
  checksum      = '3f2760be6c8b36698308470947783b1f5ce7ebcb4e2ae6bf2761212f5c925823'
  checksumType  = 'sha256'
  unzipLocation = $toolsPath
}

Install-ChocolateyZipPackage @archiveArgs
