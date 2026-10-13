```powershell
$ErrorActionPreference = 'Stop'

$url = 'https://raw.githubusercontent.com/anab1os/NetworkCap/main/NetworkCap.exe'
$dir = Join-Path $env:LOCALAPPDATA 'NetworkCap'
$exe = Join-Path $dir 'NetworkCap.exe'

New-Item -ItemType Directory -Path $dir -Force | Out-Null

Invoke-WebRequest -Uri $url -OutFile $exe

$hash = Get-FileHash -Path $exe -Algorithm SHA256

Write-Host "Downloaded: $exe"
Write-Host "SHA256: $($hash.Hash)"

$answer = Read-Host 'Verify the executable before running it. Launch now? (yes/no)'

if ($answer -eq 'yes') {
    Start-Process -FilePath $exe
}
```
