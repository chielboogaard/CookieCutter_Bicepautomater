param Location string

// tag schema params
param Tags object = {}

// utility params
param prefix string

// appServicePlan params
param AspKind string
param AspSku object

// webApp params
param Kind string
  // webApp setting params
  param HttpsOnly bool = true
  param Reserved bool = false // for linux webapps
  param AppSettings array = []
  param ConnectionStrings array = []
  param LinuxFxVersion string = ''
  param MinTlsVersion string = '1.2'
  param Use32BitWorkerProcess bool = false

resource _appServicePlan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: '${prefix}-ASP-1'
  location: Location
  tags: Tags
  kind: AspKind
  sku: AspSku
  properties: {
    reserved: Reserved
  }
}

resource _webApp 'Microsoft.Web/sites@2022-03-01' = {
  dependsOn: []
  name: '${prefix}-APP-1'
  location: Location
  tags: Tags
  kind: Kind
  properties: {
    serverFarmId: _appServicePlan.id
    httpsOnly: HttpsOnly
    reserved: Reserved
    siteConfig: {
      connectionStrings: ConnectionStrings
      linuxFxVersion: (!empty(LinuxFxVersion)) ? LinuxFxVersion : null
      minTlsVersion: MinTlsVersion
      use32BitWorkerProcess: Use32BitWorkerProcess
      appSettings: AppSettings
    }
  }
}

// checkov exceptions
//checkov:skip=CKV_AZURE_16:Ensure that Register with Azure Active Directory is enabled on App Service
