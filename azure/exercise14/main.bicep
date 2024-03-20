@description('The Azure region where the Cosmos DB account should be created')
param location string = resourceGroup().location

@description('The name of the Cosmos DB account. This name must be globally unique, and contain only lowercase letters, numbers, and hyphens')
@minLength(3)
@maxLength(44)
param cosmosDBAccountName string = 'toy-${uniqueString(resourceGroup().id)}'

@description('A descriptive name for the role definition.')
param roleDefinitionFriendlyName string = 'Read and Write'

@description('The list of actions that the role definition permits.')
param roleDefinitionDataActions array = [
  'Microsoft.DocumentDB/databaseAccounts/readMetadata'
  'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/items/*'
]

@description('The object ID of the Azure AD principal that should be granted access using the role definition.')
param roleAssignmentPrincipalId string

var roleDefinitionName = guid('sql-role-definition', cosmosDBAccount.id)
var roleAssignmentName = guid('sql-role-assignment', cosmosDBAccount.id)

resource cosmosDBAccount 'Microsoft.DocumentDB/databaseAccounts@2021-04-15' = {
  name: cosmosDBAccountName
  kind: 'GlobalDocumentDB'
  location: location
  properties: {
    consistencyPolicy: {
      defaultConsistencyLevel: 'Session'
    }
    locations: [
      {
        locationName: location
        failoverPriority: 0
        isZoneRedundant: false
      }
    ]
    databaseAccountOfferType: 'Standard'
    enableAutomaticFailover: false
    enableMultipleWriteLocations: false
    backupPolicy: {
      type: 'Continuous'
    }
  }
}

resource roleDefinition 'Microsoft.DocumentDB/databaseAccounts/sqlRoleDefinitions@2021-04-15' = {
  parent: cosmosDBAccount
  name: roleDefinitionName
  properties: {
    roleName: roleDefinitionFriendlyName
    type: 'CustomRole'
    assignableScopes: [
      cosmosDBAccount.id
    ]
    permissions: [
      {
        dataActions: roleDefinitionDataActions
      }
    ]
  }
}

resource roleAssignment 'Microsoft.DocumentDB/databaseAccounts/sqlRoleAssignments@2021-04-15' = {
  parent: cosmosDBAccount
  name: roleAssignmentName
  properties: {
    roleDefinitionId: roleDefinition.id
    principalId: roleAssignmentPrincipalId
    scope: cosmosDBAccount.id
  }
}
