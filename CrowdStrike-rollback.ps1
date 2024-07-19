$systemLanguage = $env:LANG

if ($systemLanguage -ne "es-ES" -and $systemLanguage -ne "en-US") {
    $systemLanguage = "en-US"
}

$esMessages = @{
    ErrorDirectoryNoExists = "El directorio %s no existe."
    ErrorFileNotFound = "No se encontraron archivos que coincidan con el patrón %s."
    LanguageChangeInstructions = "Para cambiar el idioma del script, establezca la variable de entorno 'LANGUAGE' con el valor 'es' o 'en'."
    ExecutionInstructions = "Ejecute el script en Modo Seguro o en el Entorno de Recuperación de Windows."
}

$enMessages = @{
    ErrorDirectoryNoExists = "The directory %s does not exist."
    ErrorFileNotFound = "No files matching the pattern %s were found."
    LanguageChangeInstructions = "To change the script language, set the 'LANGUAGE' environment variable to 'es' or 'en'."
    ExecutionInstructions = "Run the script in Safe Mode or in the Windows Recovery Environment."
}

# Comprobar si se ejecuta en modo seguro
function Test-SafeMode {
    $regkey = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SafeBoot" -ErrorAction SilentlyContinue
    return $regkey -ne $null
}

if (-not (Test-SafeMode)) {
    if ($systemLanguage -like "es*") {
        Write-Host $esMessages["ErrorSafeMode"] -ForegroundColor Red
    } else {
        Write-Host $enMessages["ErrorSafeMode"] -ForegroundColor Red
    }
    exit
}

# Ruta al directorio de CrowdStrike
$directoryPath = "C:\Windows\System32\drivers\CrowdStrike"

# Verificar si el directorio existe
if (Test-Path -Path $directoryPath) {
    # Buscar y eliminar el archivo que coincide con el patrón
    $files = Get-ChildItem -Path $directoryPath -Filter "C-00000291*.sys"
    if ($files.Count -gt 0) {
        foreach ($file in $files) {
            Remove-Item -Path $file.FullName -Force
            if ($systemLanguage -like "es*") {
                Write-Host "Archivo eliminado: $($file.FullName)" -ForegroundColor Green
            } else {
                Write-Host "File removed: $($file.FullName)" -ForegroundColor Green
            }
        }
    } else {
        if ($systemLanguage -like "es*") {
            Write-Host $esMessages["ErrorNoMatchingFiles"] -ForegroundColor Yellow
        } else {
            Write-Host $enMessages["ErrorNoMatchingFiles"] -ForegroundColor Yellow
        }
    }
} else {
    if ($systemLanguage -like "es*") {
        Write-Host $esMessages["ErrorDirectoryNotFound"]($directoryPath) -ForegroundColor Red
    } else {
        Write-Host $enMessages["ErrorDirectoryNotFound"]($directoryPath) -ForegroundColor Red
    }
}

# Reiniciar el sistema
Restart-Computer -Force
