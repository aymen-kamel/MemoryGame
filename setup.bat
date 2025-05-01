@echo off
echo Setting up Memory Game environment...

REM Check if Java is installed
java -version 2>nul
if errorlevel 1 (
    echo Java is not installed. Please install Java JDK first.
    pause
    exit /b
)

REM Download and install Maven if not present
mvn -version 2>nul
if errorlevel 1 (
    echo Installing Maven...
    powershell -Command "Invoke-WebRequest -Uri 'https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip' -OutFile 'maven.zip'"
    powershell -Command "Expand-Archive -Path 'maven.zip' -DestinationPath 'C:\Program Files\Apache' -Force"
    setx PATH "%PATH%;C:\Program Files\Apache\apache-maven-3.9.6\bin"
    del maven.zip
    echo Maven installed successfully.
)

REM Download and install Tomcat if not present
if "%CATALINA_HOME%" == "" (
    echo Installing Tomcat...
    powershell -Command "Invoke-WebRequest -Uri 'https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85-windows-x64.zip' -OutFile 'tomcat.zip'"
    powershell -Command "Expand-Archive -Path 'tomcat.zip' -DestinationPath 'C:\Program Files\Apache' -Force"
    setx CATALINA_HOME "C:\Program Files\Apache\apache-tomcat-9.0.85"
    del tomcat.zip
    echo Tomcat installed successfully.
)

echo.
echo Environment setup complete!
echo Please restart your terminal and run install.bat
echo.
pause 