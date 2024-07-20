@echo off
setlocal

:: Comprobar si se ejecuta en modo seguro
reg query "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot" >nul 2>&1
if %errorlevel% neq 0 (
    echo El sistema no está en modo seguro. Por favor, reinicia en modo seguro o en el entorno de recuperacion de Windows.
    exit /b
)

:: Ruta al directorio de CrowdStrike
set "directoryPath=C:\Windows\System32\drivers\CrowdStrike"

:: Verificar si el directorio existe
if exist "%directoryPath%" (
    :: Buscar y eliminar el archivo que coincide con el patrón
    for %%F in ("%directoryPath%\C-00000291*.sys") do (
        del /f C:\Windows\System32\drivers\CrowdStrike\C-00000291*.sys
        ren C:\Windows\System32\drivers\CrowdStrike C:\Windows\System32\drivers\CrowdStrike.old
        echo Archivo eliminado exitosamente!!!
    )
    
    :: Comprobar si se eliminaron archivos
    if errorlevel 1 (
        echo No se encontraron archivos que coincidan con el patrón C-00000291*.sys
    )
) else (
    echo El directorio %directoryPath% no existe.
)

echo retire el pendrive, para reiniciar el sistema oprima enter
pause
:: Reiniciar el sistema
shutdown /r /f /t 0
