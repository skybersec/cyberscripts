#Pre-req Download PECmd and reference from relative path or place in current working directory
$files = Get-ChildItem "C:\Windows\Prefetch\" -Filter *.EXE*.pf
foreach ($f in $files){
    .\PECmd.exe -f C:\Windows\Prefetch\$f >> C:\outputfolder\$f.txt
}
