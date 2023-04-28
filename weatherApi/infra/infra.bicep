param location string

@description('The named web app')
param webappname string

var appserviceplan = '${webappname}-plan'


resource appPlan 'Microsoft.Web/serverfarms@2018-02-01' = {
  name: appserviceplan
  location: location
  sku: {
    name: 'S1'
    capacity: 1
  }
}

resource web 'Microsoft.Web/sites@2018-11-01' = {
  name: webappname
  location: location
  properties: {    
    serverFarmId: appPlan.id
    siteConfig: {
      netFrameworkVersion: 'v7.0'
      metadata: [
        {
          name: 'CURRENT_STACK'
          value: 'dotnet'
        }
      ]
      alwaysOn: true
    }
  }
}

output url string = 'https://${web.properties.hostNames[0]}'
