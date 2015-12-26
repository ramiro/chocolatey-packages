$packageName = 'hack'
$url = 'https://github.com/chrissimpkins/Hack/releases/download/v2.018/Hack-v2_018-ttf.zip'

$destination = Join-Path $Env:Temp $packageName

Install-ChocolateyZipPackage $packageName -url $url -unzipLocation $destination

$shell = New-Object -ComObject Shell.Application
$fontsFolder = $shell.Namespace(0x14)

Get-ChildItem $destination -Recurse -Filter *.ttf |
    ForEach-Object { $fontsFolder.CopyHere($_.FullName) }

Remove-Item $destination -Recurse
