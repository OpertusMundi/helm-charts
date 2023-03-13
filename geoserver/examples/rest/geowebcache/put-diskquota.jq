# See https://docs.geoserver.org/stable/en/user/geowebcache/rest/diskquota.html
# Example: jq -n -c --arg gigabytes 15 --arg cleanupFrequencySeconds 25 -f put-diskquota.jq | curl -f -n ${geoserver_url}/gwc/rest/diskquota.json -XPUT -d @-
{
    "gwcQuotaConfiguration": {
        "diskBlockSize": 2048,
        "cacheCleanUpFrequency": ($cleanupFrequencySeconds | tonumber),
        "cacheCleanUpUnits": "SECONDS",
        "enabled": true,
        "globalQuota": {
            "value": ($gigabytes | tonumber), "units":"GiB"
        }
    }
}
