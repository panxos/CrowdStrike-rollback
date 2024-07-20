# CrowdStrike-rollback

<p align="center">
  <img src="https://raw.githubusercontent.com/panxos/ConfServerDebian/main/panxos_logo.png" alt="PanXOS Logo" width="200"/>
</p>

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
Espero les sirva para por lo menos automatizar el tema en un porcentaje.

Agradecimiento a: https://github.com/jpalma76 por la mejora al scrip batch.

======================================================================================================
## UPDATE BitLocker
## ⚠ Crowdstrike vs Bitlocker⚠ 

✔ Solución de errores de actualización de CrowdStrike con BitLocker habilitado ✔ 

## Encontrar problemas con las actualizaciones de CrowdStrike, especialmente cuando BitLocker está habilitado, puede ser una experiencia frustrante. Aquí hay una guía paso a paso para resolver este problema:

1. Recorra los BSOD hasta llegar a la pantalla de recuperación.
2. Vaya a Solucionar problemas > opciones avanzadas > Configuración de inicio.
3. Presione "Reiniciar".
4. Omita el primer mensaje de la clave de recuperación de BitLocker presionando Esc.
5. Omita el segundo mensaje de clave de recuperación de BitLocker seleccionando Omitir esta unidad en la parte inferior derecha.
6. Vaya a Solucionar problemas > opciones avanzadas > símbolo del sistema.
7. Escriba "bcdedit /set {default} safeboot minimal", luego presione enter.
8. Vuelva al menú principal de WinRE y seleccione Continuar.
9. El sistema puede repetir 2-3 veces.
10. Si arranca en modo seguro, inicie sesión como de costumbre.
11. Abra el Explorador de Windows, navegue hasta C:\Windows\System32\drivers\Crowdstrike.
12. Elimine el archivo ofensivo que comienza con C-00000291 y tiene una extensión de archivo .sys.
13. Abra el símbolo del sistema (como administrador).
14. Escriba "bcdedit /deletevalue {default} safeboot", luego presione enter.
15. Reinicie normalmente y confirme el comportamiento normal.

Link: https://www.linkedin.com/posts/jaymwakideu_crowdstrike-activity-7220287228986466305-VyUw?utm_source=share&utm_medium=member_desktop

