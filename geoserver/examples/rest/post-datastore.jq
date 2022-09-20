# POST ${geoserver_url}/rest/workspaces/${workspace}/datastores
{
  "dataStore": {
    "name": $name,
    "connectionParameters": {
      "entry": [
        {"@key":"dbtype", "$": "postgis"},
        {"@key":"host", "$": $host},
        {"@key":"port", "$": "5432"},
        {"@key":"database", "$": $database},
        {"@key":"schema", "$": $schema},
        {"@key":"user", "$": $username},
        {"@key":"passwd", "$": $password}
      ]
    }
  }
}

