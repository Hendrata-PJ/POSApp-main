@echo off
setlocal
rem Launcher for MiniPOS
rem - If a runnable jar exists in target, try to run it.
rem - Otherwise run via Maven plugin (requires Maven installed).

pushd "%~dp0"

set JAR=target\MiniPOS-1.0-SNAPSHOT.jar

if exist "%JAR%" (
    echo Found %JAR% - attempting to run...
    java -jar "%JAR%"
    if errorlevel 1 (
        echo java -jar failed - trying Maven run as fallback...
        mvn javafx:run
    )
) else (
    echo Jar not found. Building and running via Maven - this may take a while...
    mvn javafx:run
)

popd
endlocal
