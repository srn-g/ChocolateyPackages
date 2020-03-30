$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/csanuragjain/APKRepatcher/releases/download/v1.1.0/APKRepatcher.zip'
$url64 = ''

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64

  softwareName   = 'apkrepatcher*'

  checksum       = ''
  checksumType   = 'sha256'
  checksum64     = ''
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut `
  -ShortcutFilePath "$([Environment]::GetFolderPath('CommonStartMenu'))\Programs\APKRepatcher.lnk" `
  -TargetPath "$toolsDir\APKRepatcher.jar"