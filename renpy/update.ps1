import-module au

$releases = 'https://www.renpy.org/latest.html'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $url32   = $download_page.links | ? href -match '\.7z\.exe$' | % href | Select-Object -First 1
    $version = Split-Path ( Split-Path $url32 ) -Leaf

    @{
        URL32   = $url32
        Version = $version
    }
}

update
