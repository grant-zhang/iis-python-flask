# escape=`
FROM python:3.7.4-windowsservercore-1803

LABEL maintainer="dayusoft@hotmail.com"

# enable IIS
RUN powershell -Command `
    Add-WindowsFeature Web-Server; `
    Invoke-WebRequest -UseBasicParsing -Uri "https://dotnetbinaries.blob.core.windows.net/servicemonitor/2.0.1.6/ServiceMonitor.exe" -OutFile "C:\ServiceMonitor.exe"

EXPOSE 80

ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]

# enable CGI
RUN dism /online /enable-feature /featurename:IIS-CGI /all

# install flask and fastCGI
RUN pip install wfastcgi flask

# config fastCGI
RUN wfastcgi-enable

# IIS by default denies changes to webServer/handlers. Need to unlock for python handlers
RUN c:\Windows\System32\inetsrv\appcmd.exe unlock config -section:system.webServer/handlers

# copy sample code 
COPY home c:/inetpub/wwwroot
