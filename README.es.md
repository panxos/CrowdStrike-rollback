# CrowdStrike-rollback
## Descripción
CrowdStrike-rollback.ps1 es un script de PowerShell diseñado para automatizar el proceso de eliminación de un archivo específico relacionado con CrowdStrike que puede estar causando problemas en tu sistema Windows. Este script debe ejecutarse en Modo Seguro o en el Entorno de Recuperación de Windows.

## Problema con CrowdStrike
CrowdStrike es una solución de seguridad que protege los endpoints contra amenazas. Sin embargo, en algunas situaciones, ciertos archivos de CrowdStrike pueden corromperse o causar problemas que impiden el funcionamiento correcto del sistema. En este caso específico, se debe eliminar un archivo denominado `C-00000291*.sys` en el directorio `C:\Windows\System32\drivers\CrowdStrike` para resolver el problema.

## Instrucciones de Uso

### Paso 1: Preparación
- Asegúrate de tener permisos de administrador en el sistema donde se ejecutará el script.
- Guarda el script en un archivo llamado `CrowdStrike-rollback.ps1`.

### Paso 2: Inicio en Modo Seguro
1. Reinicia el sistema y entra en Modo Seguro o en el Entorno de Recuperación de Windows.
2. Para entrar en Modo Seguro, mantén presionada la tecla **Shift** mientras haces clic en "Reiniciar" y luego selecciona:
   - "Solucionar problemas"
   - "Opciones avanzadas"
   - "Configuración de inicio"
   - "Reiniciar"
   - Después, selecciona la opción para Modo Seguro.
3. Para entrar en el Entorno de Recuperación de Windows, sigue un proceso similar y selecciona:
   - "Solucionar problemas"
   - "Opciones avanzadas"
   - "Símbolo del sistema".

### Paso 3: Ejecutar el Script
1. Abre PowerShell con privilegios de administrador.
2. Navega al directorio donde se guardó el script.
3. Ejecuta el script con el siguiente comando:

   ```powershell
   .\CrowdStrike-rollback.ps1
   ```
espero les sirva para por lo menos automatizar el tema en un porcentaje.

