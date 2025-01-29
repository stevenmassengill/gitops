param storageName string // must be globally unique
param storageLocation string
param storageSku string
param storageKind string

resource stg 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageName
  location: storageLocation
  kind: storageKind
  sku: {
      name: storageSku // reference variable
  }
}

output storageId string = stg.id // output resourceId of storage account
