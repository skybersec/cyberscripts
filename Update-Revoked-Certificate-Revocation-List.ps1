New-Item -ItemType Directory -Force -Path C:\outputfolder
Set-Location -Path C:\outputfolder
Invoke-WebRequest http://ctldl.windowsupdate.com/msdownload/update/v3/static/trustedr/en/disallowedcertstl.cab -o C:\outputfolder\disallowedcertstl.cab
if(C:\Windows\System32\expand.exe)     {
    try { cmd.exe /c "C:\Windows\System32\expand.exe disallowedcertstl.cab disallowedcert.stl"}
   catch { Write-host "404 file not found try again..."}
}
certutil -addstore -f  disallowed disallowedcert.stl
#Below I was going to add the ability to check if auto checks are disabled/enabled etc.
#Get-Item -path HKLM:\\Software\Policies\Microsoft\SystemCertificates\AuthRoot\
