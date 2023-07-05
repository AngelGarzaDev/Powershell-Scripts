
echo y|chkdsk C: /f & DISM.exe /Online /Cleanup-image /Restorehealth & sfc /scannow