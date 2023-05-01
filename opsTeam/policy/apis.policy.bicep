param ApimServiceName string
param BaseUrl string

// add operation policy
resource api 'Microsoft.ApiManagement/service/apis@2020-06-01-preview' existing = {
  name: '${ApimServiceName}/mockapi'
}

// Operation level policies - Mock API
resource operation 'Microsoft.ApiManagement/service/apis/operations@2020-06-01-preview' existing = {
  parent:api
  name: 'getdata'
}
resource operationPolicy 'Microsoft.ApiManagement/service/apis/operations/policies@2020-06-01-preview' = {
  parent:operation
  name: 'policy'
  properties: {
    format: 'xml'
    value: '${BaseUrl}/policy/mockapi.xml'
  }
}


