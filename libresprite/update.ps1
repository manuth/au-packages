import-module au

$releases = 'https://libresprite.github.io'

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

    $url32   = $download_page.links | ? href -match '\.exe$' | % href | Select-Object -First 1
    $version = '1.0'

    @{
        URL32   = $url32
        Version = $version
    }
}

update
