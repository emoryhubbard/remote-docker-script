cd remote-docker-master
SET duration_in_mins = 40320
SET sign_in_interval_in_mins = 30
SET run_interval_in_s = 60

setlocal enabledelayedexpansion
FOR /L %%m IN (0, 1, 40320) DO (
    SET /A mod=%%m %% 30
    IF !mod!==0 CALL :sign_in_periodically
    CALL :run_terraform
    CALL :exit_if_success_or_unusual_error
    timeout /t 60 /nobreak
)
endlocal
PAUSE

:run_terraform
    echo yes | terraform apply 2> log.txt
EXIT /B 0

:exit_if_success_or_unusual_error
    type log.txt | find "Out of host capacity"
    IF NOT %ERRORLEVEL%==0 EXIT
EXIT /B 0

:sign_in_periodically
    DEL C:\Users\edhth\.oci\config
    DEL C:\Users\edhth\.oci\sessions\DEFAULT\oci_api_key.pem
    DEL C:\Users\edhth\.oci\sessions\DEFAULT\oci_api_key_public.pem
    DEL C:\Users\edhth\.oci\sessions\DEFAULT\token
    DEL C:\Users\edhth\.oci\sessions\learn-terraform\oci_api_key.pem
    DEL C:\Users\edhth\.oci\sessions\learn-terraform\oci_api_key_public.pem
    DEL C:\Users\edhth\.oci\sessions\learn-terraform\token
    start /min cmd /c sign_in_clicks.bat
    oci session authenticate <sign_in_responses1.txt
    timeout /t 30 /nobreak
    start /min cmd /c sign_in_clicks.bat
    oci session authenticate <sign_in_responses2.txt
EXIT /B 0






REM cd remote-docker-master
REM SET duration_in_mins = 40320
REM SET sign_in_interval_in_mins = 10
REM SET run_interval_in_s = 10
REM 
REM setlocal enabledelayedexpansion
REM FOR /L %%m IN (0, 1, 40320) DO (
REM     CALL :run_terraform
REM     CALL :exit_if_success_or_unusual_error
REM     SET /A mod=%%m %% 10
REM     IF !mod!==0 CALL :sign_in_periodically
REM     timeout /t 10 /nobreak
REM )
REM endlocal
REM PAUSE
REM 
REM :run_terraform
REM     echo yes [pipe] terraform apply 2[greater than] log.txt
REM EXIT /B 0
REM :exit_if_success_or_unusual_error
REM     type log.txt [pipe] find "Out of host capacity"
REM     IF NOT %ERRORLEVEL%==0 EXIT
REM EXIT /B 0
REM :sign_in_periodically
REM     oci session refresh --profile learn-terraform
REM EXIT /B 0
REM :delay
REM EXIT /B 0


REM cd remote-docker-master
REM setlocal enabledelayedexpansion
REM FOR /L %%m IN (0, 1, 40320) DO (
REM     echo yes [pipe symbol] terraform apply 2[greater than] log.txt
REM     type log.txt [pipe symbol] find "Out of host capacity"
REM     IF NOT !ERRORLEVEL!==0 EXIT
REM     SET /A mod=%%m %% 10
REM     IF !mod!==0 oci session refresh --profile learn-terraform
REM     timeout /t 60 /nobreak
REM )
endlocal
PAUSE
REM FOR /L %%x IN (0, 1, 1) DO (
REM     ECHO %%x
REM     echo yes /*pipe*/ terraform apply
REM     timeout /t 60 /nobreak
REM )