param ApimServiceName string
param BaseUrl string

resource ApimServiceName_policy 'Microsoft.ApiManagement/service/policies@2021-01-01-preview' = {
  properties: {
    value: '${BaseUrl}/policy/global.xml'
    format: 'rawxml-link'
  }
  name: '${ApimServiceName}/policy'
}

// add apim operation policy
resource ApimServiceName_operation_policy 'Microsoft.ApiManagement/service/operationpolicies@2021-01-01-preview' = {
  properties: {
    value: '${BaseUrl}/policy/mockapi.xml'
    format: 'rawxml-link'
  }
  name: '${ApimServiceName}/mockapi'
}
 

