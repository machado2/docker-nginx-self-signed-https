FROM  mcr.microsoft.com/windows/servercore:ltsc2019
RUN powershell -Command \
    $ErrorActionPreference = 'Stop'; \
    Invoke-WebRequest -Method Get -Uri http://nginx.org/download/nginx-1.21.4.zip -OutFile c:\nginx-1.21.4.zip ; \
    Expand-Archive -Path c:\nginx-1.21.4.zip -DestinationPath c:\ ; \
    Remove-Item c:\nginx-1.21.4.zip -Force
WORKDIR /nginx-1.21.4
COPY cert.crt conf/
COPY cert.key conf/
COPY nginx-default.conf conf/nginx.conf
COPY run.ps1 ./
ENV REMOTE_URL="http://localhost:8080/"
CMD powershell ./run.ps1
