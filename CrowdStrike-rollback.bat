@echo off
setlocal EnableDelayedExpansion

:: Obtener el idioma del sistema
set "systemLanguage=%LANG%"

:: Establecer idioma predeterminado a inglés (en-US) si no es español (es-ES) o inglés (en-US)
if not "!systemLanguage!" like "es-ES" and not "!systemLanguage!" like "en-US" (
  set "systemLanguage=en-US"
)

:: Definir variables de idioma
set "esMessages=!" (
  echo ErrorSafeMode=El sistema no está en modo seguro. Por favor, reinicia en modo seguro o en el entorno de recuperación de Windows.
  echo ErrorDirectoryNotFound=El directorio %directoryPath% no existe.
  echo ErrorNoMatchingFiles=No se encontraron archivos que coincidan con el patrón C-00000291*.sys
  echo LanguageChangeInstructions=Para cambiar el idioma del script, establezca la variable de entorno 'LANGUAGE' con el valor 'es' o 'en'.
  echo ExecutionInstructions=Ejecute el script en Modo Seguro o en el Entorno de Recuperación de Windows.
  echo FileRemoved=Archivo eliminado: !f!
)

set "enMessages=!" (
  echo ErrorSafeMode=The system is not in Safe Mode. Please restart in Safe Mode or in the Windows Recovery Environment.
  echo ErrorDirectoryNotFound=The directory %directoryPath% does not exist.
  echo ErrorNoMatchingFiles=No files matching the pattern C-00000291*.sys were found.
  echo LanguageChangeInstructions=To change the script language, set the 'LANGUAGE' environment variable to 'es' or 'en'.
  echo ExecutionInstructions=Run the script in Safe Mode or in the Windows Recovery Environment.
  echo FileRemoved=File removed: !f!
)

:: Comprobar si se ejecuta en modo seguro
reg query "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot" >nul 2>&1
if %errorlevel% neq 0 (
  if !systemLanguage! like "es*" (
    echo !esMessages:ErrorSafeMode!
  ) else (
    echo !enMessages:ErrorSafeMode!
  )
  exit /b
)

:: Ruta al directorio de CrowdStrike
set "directoryPath=C:\Windows\System32\drivers\CrowdStrike"

:: Verificar si el directorio existe
if exist "%directoryPath%" (
  :: Buscar y eliminar el archivo que coincide con el patrón
  for %%F in ("%directoryPath%\C-00000291*.sys") do (
    del /f "%%F"
    if !systemLanguage! like "es*" (
      echo !esMessages:FileRemoved!=%%F!
    ) else (
      echo !enMessages:FileRemoved!=%%F!
    )
  )

  :: Comprobar si se eliminaron archivos
  if errorlevel 1 (
    if !systemLanguage! like "es*" (
      echo !esMessages:ErrorNoMatchingFiles!
    ) else (
      echo !enMessages:ErrorNoMatchingFiles!
    )
  )
) else (
  if !systemLanguage! like "es*" (
    echo !esMessages:ErrorDirectoryNotFound!=%directoryPath%!
  ) else (
    echo !enMessages:ErrorDirectoryNotFound!=%directoryPath%!
  )
)

:: Reiniciar el sistema
shutdown /r /t 0