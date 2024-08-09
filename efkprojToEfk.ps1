$dir = Read-Host "input directoryPath which exists efkproj files" # ディレクトリを指定
$files = Get-ChildItem -Path $dir -Filter *.efkproj # .efkprojファイルを取得

# efkprojファイルを1つずつefkファイルに変換する
foreach ($file in $files) {
    $nameWithoutExtension = [System.IO.Path]::GetFileNameWithoutExtension($file) # 拡張子を除いたファイル名を取得
    .\Effekseer.exe -cui -in "$($dir)\$($file)" -e "$($dir)\$($nameWithoutExtension).efk"
    Start-Sleep 1.5
}