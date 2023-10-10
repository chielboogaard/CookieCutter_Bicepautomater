using '../main.bicep'

@allowed([
  'DEV' // Development
  'QA' // Quality Assurance
  'TEST' // Test
  'ACC' // Acceptance
  'PROD' // Production
])
param environment = '{{cookiecutter.environment}}'
param Location = 'westeurope'
param prefix = '{{cookiecutter.prefix}}-${environment}'
