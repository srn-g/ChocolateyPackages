$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://cdn1.ashampoo.net/public/ashf/1004/Ashampoo_AntiSpy.exe'

Get-ChocolateyWebFile -PackageName $env:ChocolateyPackageName -FileFullPath "$toolsDir\Ashampoo_AntiSpy.exe" -Url $url

Install-ChocolateyShortcut `
  -ShortcutFilePath "$([Environment]::GetFolderPath('CommonStartMenu'))\Programs\Ashampoo_AntiSpy.lnk" `
  -TargetPath "$toolsDir\Ashampoo_AntiSpy.exe"