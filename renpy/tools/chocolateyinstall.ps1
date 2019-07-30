$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'renpy'
  fileType      = 'exe'
  url           = 'https://www.renpy.org/dl/7.3.2/renpy-7.3.2-sdk.7z.exe'
  softwareName  = 'renpy*'
  checksum      = '8d6e511ce39324e1ea2d659af727e3bbf7969f10fef1a313241391e2a6ff77a6'
  checksumType  = 'sha256'
  silentArgs    = "-y -gm2"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
