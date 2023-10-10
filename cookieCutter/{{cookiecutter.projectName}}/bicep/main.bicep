targetScope = 'subscription'
param Location string

param environment string

param prefix string

resource ResourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: '${prefix}-RG-1'
  location: Location
}
