((Get-Content -path conf\nginx.conf -Raw) -replace 'XX_REMOTE_URL_XX',$env:REMOTE_URL) | Set-Content -Path conf\nginx.conf
.\nginx
