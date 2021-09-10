$resourceGroup = "tf-backend"
$location="eastus2"

$sact="tfstatestorage2021"

New-AzResourceGroup -Name $resourceGroup -Location $location

$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroup -Name $sact -SkuName Standard_LRS -Location $location

$ctx = $storageAccount.Context

$containerName = "tf-states"
New-AzStorageContainer -Name $containerName -Context $ctx #-Permission blob