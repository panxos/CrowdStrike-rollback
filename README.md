## CrowdStrike-rollback.ps1

### Description

CrowdStrike-rollback.ps1 is a PowerShell script that automates the removal of a specific CrowdStrike-related file that may be causing problems on your Windows system. This script must be run in Safe Mode or in the Windows Recovery Environment.

### CrowdStrike Issue

CrowdStrike is a security solution that protects endpoints against threats. However, in some situations, certain CrowdStrike files may become corrupted or cause problems that prevent the system from functioning properly. In this specific case, a file named `C-00000291*.sys` in the directory `C:\Windows\System32\drivers\CrowdStrike` must be deleted to resolve the issue.

### Prerequisites

- Administrator permissions on the system where the script will be run.
- Save the script as `CrowdStrike-rollback.ps1`.

### Steps to Run the Script

**1. Boot into Safe Mode or Windows Recovery Environment**

**1.1 Safe Mode**

1. Restart the system and press and hold the **Shift** key while clicking "Restart".
2. Select "Troubleshoot" > "Advanced options" > "Startup settings" > "Restart".
3. Upon restart, select the option to boot into Safe Mode.

**1.2 Windows Recovery Environment**

1. Follow steps 1 and 2 from Safe Mode.
2. Under "Advanced options", select "Command Prompt".

**2. Execute the Script**

1. Open PowerShell with administrator privileges.
2. Navigate to the directory where you saved the script.
3. Run the script with the following command:

```powershell
.\CrowdStrike-rollback.ps1
```

### Disclaimer

This script is intended for advanced users and should be used with caution. It is important to understand the potential risks involved before running any script on your system. It is always recommended to have a backup of your system before making any changes.

### Contributions

Feel free to contribute to this script or the documentation. Your help is valuable in improving the community.
