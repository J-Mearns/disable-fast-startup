#Disable Fast Boot/Fast Startup.
#===============================

#Changes the value of "HiberbootEnabled" to "0", disabling Fast Startup.
New-ItemProperty -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -Name "HiberbootEnabled" -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
