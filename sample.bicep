@description('The location for deploying the storage account')
param location string = resourceGroup().location

var storageAccountName = '${uniqueString(resourceGroup().id)}data'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  kind: 'StorageV2'
  location: location
  name: storageAccountName

  sku: {
    name: 'Standard_GRS'
  }

  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
  }
}
