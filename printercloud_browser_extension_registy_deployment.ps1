# Add registry to install printercloud client extension on Chrome
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist /v 1 /t REG_SZ /d bfgjjammlemhdcocpejaompfoojnjjfn /f
#
# Add registry to install printercloud client extension on Edge
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist /v 1 /t REG_SZ /d  'bfgjjammlemhdcocpejaompfoojnjjfn;https://clients2.google.com/service/update2/crx' /f