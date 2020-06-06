$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://cdn1.ashampoo.net/public/ashf/1004/Ashampoo_AntiSpy.exe'

Get-ChocolateyWebFile -PackageName $env:ChocolateyPackageName -FileFullPath "$toolsDir\Ashampoo_AntiSpy.exe" -Url $url -Checksum "4EDCFFCFADB0AF69C1563B05DF9A33B1C2803F0A37DB8FA73C8B172EA7E886F9" -ChecksumType "sha256"

Install-ChocolateyShortcut `
  -ShortcutFilePath "$([Environment]::GetFolderPath('CommonStartMenu'))\Programs\Ashampoo_AntiSpy.lnk" `
  -TargetPath "$toolsDir\Ashampoo_AntiSpy.exe"