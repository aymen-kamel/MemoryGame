@echo off
echo Installing Memory Game...

REM Check if Java is installed
java -version 2>nul
if errorlevel 1 (
    echo Java is not installed. Please install Java JDK first.
    pause
    exit /b
)

REM Check if Maven is installed
mvn -version 2>nul
if errorlevel 1 (
    echo Maven is not installed. Please install Maven first.
    echo Download from: https://maven.apache.org/download.cgi
    echo Add Maven bin directory to your PATH
    pause
    exit /b
)

REM Check if CATALINA_HOME is set
if "%CATALINA_HOME%" == "" (
    echo CATALINA_HOME is not set. Please install Tomcat first.
    echo Download from: https://tomcat.apache.org/download-90.cgi
    pause
    exit /b
)

REM Build the project
echo Building project...
call mvn clean package

REM Copy WAR file to Tomcat
echo Copying WAR file to Tomcat...
copy /Y target\JetxDeMemoireJEE.war "%CATALINA_HOME%\webapps\JetxDeMemoireJEE.war"

REM Start Tomcat if not running
echo Starting Tomcat...
if not exist "%CATALINA_HOME%\logs\catalina.pid" (
    call "%CATALINA_HOME%\bin\startup.bat"
)

echo.
echo Installation complete!
echo Access the game at: http://localhost:8080/JetxDeMemoireJEE
echo.
pause 