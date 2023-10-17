targetScope = 'subscription'
param Location string

param environment string

param prefix string

resource ResourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: '${prefix}-RG-1'
  location: Location
}

{% if cookiecutter.database == 'mysql'%}
resource mysql 'Microsoft.DBforMySQL/flexibleServers@2022-01-01' existing = {
  name: 'test'
}
{% endif %}
