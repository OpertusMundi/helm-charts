# PUT ${geoserver_url}/rest/namespaces/${workspace}
{
    "namespace": {
        "prefix": $prefix,
        "uri": ("urn:opertusmundi.eu:workspaces/" + $prefix),
        "isolated": true
    }
}
