#Login to Azure Resource Manager
Login-AzureRmAccount

############# Task 1 ###############

#Create Resource Group for Storage Account
New-AzureRmResourceGroup -Name "StorageAccount-tst" -Location "WestEurope"

#Deploy Storage Account
New-AzureRmResourceGroupDeployment -StorageAccountPrefix "#StoragePrefix#" -Name "deployStorage-$(Get-Date -Format 'yyyMMddhhmmss')" `
    -ResourceGroupName 'StorageAccount-tst' -TemplateFile .\2_StorageAccount.json






& '.\3. azmgmt-demo-Simple\Deploy-AzureResourceGroup.ps1' -ResourceGroupLocation 'WestEurope' -ResourceGroupName "armDemo-MGMT2" -Verbose -UploadArtifacts


New-AzureRmResourceGroup -ResourceGroupName 'armDemo-VMs' -Location "WestEurope"
& '.\3. azmgmt-demo-Advanced\Deploy-AzureResourceGroup.ps1' -ResourceGroupLocation 'WestEurope' -ResourceGroupName "armDemo-MGMT2" -Verbose -UploadArtifacts



