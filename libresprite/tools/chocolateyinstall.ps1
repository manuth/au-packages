$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'libresprite'
  fileType      = 'exe'
  url           = 'https://github.com/LibreSprite/LibreSprite/releases/download/_tmp/LibreSpriteWin.exe'
  softwareName  = 'libresprite*'
  checksum      = '0b97559ddb9979f67836941b52caadafba37c22b639aa8bc0643cd17916a5324'
  checksumType  = 'sha256'
  silentArgs    = "-y -gm2"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
