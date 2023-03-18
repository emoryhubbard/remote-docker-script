    DEL C:\Users\edhth\.oci\config
    DEL C:\Users\edhth\.oci\sessions\DEFAULT\oci_api_key.pem
    DEL C:\Users\edhth\.oci\sessions\DEFAULT\oci_api_key_public.pem
    DEL C:\Users\edhth\.oci\sessions\DEFAULT\token
    DEL C:\Users\edhth\.oci\sessions\learn-terraform\oci_api_key.pem
    DEL C:\Users\edhth\.oci\sessions\learn-terraform\oci_api_key_public.pem
    DEL C:\Users\edhth\.oci\sessions\learn-terraform\token
    start /min cmd /c sign_in_clicks.bat
    oci session authenticate <sign_in_responses1.txt
    timeout /t 10 /nobreak
    start /min cmd /c sign_in_clicks.bat
    oci session authenticate <sign_in_responses2.txt
