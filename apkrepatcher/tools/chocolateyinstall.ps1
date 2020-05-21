$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/csanuragjain/APKRepatcher/releases/download/v1.1.0/APKRepatcher.zip'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'ZIP'
  url            = $url

  softwareName   = 'apkrepatcher*'

  checksum       = '9d415be31e2a4f0ff843e2e0e334bf92d7a8b1bf79ddd60ba8b06a5cbe2c5612'
  checksumType   = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut `
  -ShortcutFilePath "$([Environment]::GetFolderPath('CommonStartMenu'))\Programs\APKRepatcher.lnk" `
  -TargetPath "$toolsDir\APKRepatcher.jar"