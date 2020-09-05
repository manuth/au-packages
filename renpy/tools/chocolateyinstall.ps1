$ErrorActionPreference = 'Stop';
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = 'renpy'
  fileType      = 'exe'
  url           = 'https://www.renpy.org/dl/7.3.5/renpy-7.3.5-sdk.7z.exe'
  softwareName  = 'renpy*'
  checksum      = '3f2760be6c8b36698308470947783b1f5ce7ebcb4e2ae6bf2761212f5c925823'
  checksumType  = 'sha256'
  silentArgs    = "-y -gm2 -o$toolsPath"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
