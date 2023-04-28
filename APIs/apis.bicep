param ApimServiceName string

resource ApimServiceName_fibonacci 'Microsoft.ApiManagement/service/apis@2022-04-01-preview' = {  
  name: '${ApimServiceName}/sampleapi'
  properties: {
    apiRevision: '1'
    isCurrent: true
    subscriptionRequired: true
    displayName: 'sampleapi'    
    format: 'openapi+json'
    value: loadTextContent('./sampleapi.openapi.yaml')
    serviceUrl: 'https://kayapim.azure-api.net/sampleapi'
    path: 'Sampleapi'
    protocols: [
      'https'
    ]
  }  
  dependsOn: []
}
