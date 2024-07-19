## CrowdStrike-rollback.ps1

**Descripción**

CrowdStrike-rollback.ps1 es un script de PowerShell que automatiza la eliminación de un archivo específico de CrowdStrike que puede estar causando problemas en tu sistema Windows. Este script debe ejecutarse en Modo Seguro o en el Entorno de Recuperación de Windows.

**Problema con CrowdStrike**

CrowdStrike es una solución de seguridad que protege los endpoints contra amenazas. Sin embargo, en algunos casos, ciertos archivos de CrowdStrike pueden dañarse o generar problemas que impiden el correcto funcionamiento del sistema. En este caso específico, se debe eliminar un archivo llamado `C-00000291*.sys` en el directorio `C:\Windows\System32\drivers\CrowdStrike` para resolver el problema.

**Requisitos previos**

- Permisos de administrador en el sistema donde se ejecutará el script.
- Guardar el script como `CrowdStrike-rollback.ps1`.

**Pasos para ejecutar el script**

**1. Iniciar en Modo Seguro o Entorno de Recuperación de Windows**

**1.1 Modo Seguro**

1. Reinicia el sistema y presiona la tecla **Shift** mientras haces clic en "Reiniciar".
2. Selecciona "Solucionar problemas" > "Opciones avanzadas" > "Configuración de inicio" > "Reiniciar".
3. Al reiniciar, elige la opción para iniciar en Modo Seguro.

**1.2 Entorno de Recuperación de Windows**

1. Sigue los pasos 1 y 2 del Modo Seguro.
2. En "Opciones avanzadas", selecciona "Símbolo del sistema".

**2. Ejecutar el script**

1. Abre PowerShell con privilegios de administrador.
2. Navega al directorio donde guardaste el script.
3. Ejecuta el script con el siguiente comando:

```powershell
.\CrowdStrike-rollback.ps1
```

**Aviso**

Este script está dirigido a usuarios avanzados y debe utilizarse con precaución. Es importante comprender los posibles riesgos antes de ejecutar cualquier script en tu sistema. Se recomienda tener una copia de seguridad antes de realizar cambios.

**Contribuciones**

Siéntete libre de contribuir a este script o a la documentación. Tu ayuda es valiosa para mejorar la comunidad.
