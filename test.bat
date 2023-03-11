setlocal enableddelayedexpansion
FOR /L %%x IN (0, 1, 3) DO (
    ECHO %%x
    HELP
    timeout /t 2 /nobreak
)
endlocal
PAUSE









