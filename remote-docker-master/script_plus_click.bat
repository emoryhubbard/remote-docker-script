cd remote-docker-master
setlocal enabledelayedexpansion
FOR /L %%m IN (0, 1, 40320) DO (
    echo yes | terraform apply 2> log.txt
    type log.txt | find "Out of host capacity"
    IF NOT !ERRORLEVEL!==0 EXIT
    SET /A mod=%%m %% 30
    IF !mod!==0 oci session refresh --profile learn-terraform
    timeout /t 60 /nobreak
)
endlocal
PAUSE
REM FOR /L %%x IN (0, 1, 1) DO (
REM     ECHO %%x
REM     echo yes /*pipe*/ terraform apply
REM     timeout /t 60 /nobreak
REM )