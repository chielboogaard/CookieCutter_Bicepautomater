targetScope = 'subscription'
param Location string

@allowed([
  'A' // Acceptance
  'D' // Development
  'H' // Hotfix
  'I' // Infra
  'O' // Other
  'P' // Production
  'QA' // Quality Assurance
  'T' // Test
])
param environment string

param prefix string

resource ResourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: '${prefix}-${environment}-RG-1'
  location: Location
}
