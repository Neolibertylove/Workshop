#Login to Azure Resource Manager
Login-AzureRmAccount

#Validate your Azure Subscription
Get-AzureRmContext

#If need change subscription
Get-AzureRmSubscription | Out-GridView -PassThru | Select-AzureRmSubscription

############# Task 1 ############################################################################
###  Deploy Storage Account
############# Task 1 ############################################################################

#Create Resource Group for Storage Account
New-AzureRmResourceGroup -Name "StorageAccount-tst" -Location "WestEurope"

#Deploy Storage Account
New-AzureRmResourceGroupDeployment -StorageAccountPrefix "AsoTesting" -Name "deployStorage-$(Get-Date -Format 'yyyMMddhhmmss')" `
    -ResourceGroupName 'StorageAccount-tst' -TemplateFile .\2_StorageAccount.json -Verbose

############ Task 1 - END########################################################################


############# Task 2 ############################################################################
###  Deploy Simple VM
############# Task 2 ############################################################################

#Create Resource Group for Simple VM
New-AzureRmResourceGroup -Name "simpleVM-tst" -Location "WestEurope"

#Deploy Simple VM from template
New-AzureRmResourceGroupDeployment -ResourceGroupName 'simpleVM-tst' -TemplateFile .\simple-Windows-VM\azuredeploy.json `
    -TemplateParameterFile .\simple-Windows-VM\azuredeploy.parameters.json `
    -Name "deployStorage-$(Get-Date -Format 'yyyMMddhhmmss')" -Verbose

############ Task 2 - END########################################################################







& '.\3. azmgmt-demo-Simple\Deploy-AzureResourceGroup.ps1' -ResourceGroupLocation 'WestEurope' -ResourceGroupName "armDemo-MGMT2" -Verbose -UploadArtifacts


New-AzureRmResourceGroup -ResourceGroupName 'armDemo-VMs' -Location "WestEurope"
& '.\3. azmgmt-demo-Advanced\Deploy-AzureResourceGroup.ps1' -ResourceGroupLocation 'WestEurope' -ResourceGroupName "armDemo-MGMT2" -Verbose -UploadArtifacts



