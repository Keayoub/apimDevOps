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


// resource to deploy api product in file mockapi.openapi.yaml
resource ApimServiceName_mockapi 'Microsoft.ApiManagement/service/apis@2022-04-01-preview' = {  
  name: '${ApimServiceName}/mockapi'
  properties: {
    apiRevision: '1'
    isCurrent: true
    subscriptionRequired: true
    displayName: 'mockapi'    
    format: 'openapi+json'
    value: loadTextContent('./mockapi.openapi.yaml')
    serviceUrl: 'https://kayapim.azure-api.net/mockapi'
    path: 'Mockapi'
    protocols: [
      'https'
    ]
  }  
  dependsOn: []
}
