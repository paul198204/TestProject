###################################################################
#    Copyright (c) . All rights reserved.
#    
###################################################################

##################################################
# Test-CreateAzureVM
##################################################

$vm = New-AzureVMConfig -Name "example-1" -InstanceSize Small -ImageName "a699494373c04fc0bc8f2bb1389d6106__Windows-Server-2012-Datacenter-201503.01-en.us-127GB.vhd"  

$vm = Add-AzureProvisioningConfig -VM $vm -Windows -AdminUsername "user" -Password "xxxxx" 

$vm = Set-AzureVMDSCExtension -VM $vm -ConfigurationArchive "IISInstall.ps1.zip" -ConfigurationName "IISInstall"  

New-AzureVM -VM $vm -Location "Southeast Asia" -ServiceName "example-1-svc" -WaitForBoot