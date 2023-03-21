#Detect Status of Fast Boot/Fast Startup.
#========================================

#Registry path and attributes associated with Fast Boot.
$Path = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power"
$Name = "HiberbootEnabled"
$Type = "DWORD"
$Value = 0

#Checks if the "HiberbootEnabled" property is equal to "0", if so the device is compliant.
#If "HiberbootEnabled" is equal to "1" the device is not compliant (i.e. Fast Boot is enabled).
Try {
    $Registry = Get-ItemProperty -Path $Path -Name $Name -ErrorAction Stop | Select-Object -ExpandProperty $Name
    If ($Registry -eq $Value) {
        Write-Output "Compliant."
        Exit 0
        }
    Write-Warning "Not Compliant!"
    Exit 1
}
Catch {
    Write-Warning "Not Compliant!"
    Exit 1
}
