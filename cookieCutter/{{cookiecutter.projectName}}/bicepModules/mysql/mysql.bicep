param Location string

// tag schema params
param Tags object = {}

// utility params
param prefix string

// MySql params
param AdministratorLogin string = 'admin'
param AdministratorLoginPassword string
param Sku object

param CreateMode string = 'Default'

resource _MySQLServer 'Microsoft.DBforMySQL/flexibleServers@2022-01-01' = {
  name: toLower('${prefix}-APP-1')
  location: Location
  tags: Tags
  sku: Sku
  properties: {
    administratorLogin: AdministratorLogin
    administratorLoginPassword: AdministratorLoginPassword
    createMode: CreateMode
  }
}
