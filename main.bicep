targetScope = 'subscription'

param rgName string
param location string
param storageName string
param storageSku string
param storageKind string

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: rgName
  location: location
}

module stg './modules/storage.bicep' = {
  name: 'storage'
  scope: resourceGroup(rg.name)
  params: {
    storageName: storageName
    storageLocation: rg.location
    storageSku: storageSku
    storageKind: storageKind
  }
}
