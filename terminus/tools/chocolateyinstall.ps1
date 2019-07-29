$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'terminus'
  fileType      = 'exe'
  url           = 'https://github.com/Eugeny/terminus/releases/download/v1.0.87/terminus-1.0.87-setup.exe'
  softwareName  = 'terminus*'
  checksum      = 'a3ca5d1f185e36b518e346af367e921305cc50ca16421f56fc0167d17b38fa4a'
  checksumType  = 'sha256'
  silentArgs    = "/S"
  validExitCodes= @(0)
}
Install-ChocolateyPackage @packageArgs
