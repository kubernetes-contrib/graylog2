#!/bin/bash

GRAYLOG_SERVER_SECRET=${GRAYLOG_SERVER_SECRET:-82cqn9yshBFt98PQx2MLC60RTI0wc59TxC8OoPKTYgsiDrnRryzM7gvmrEkgSTeCCrEjmyQ23CNDi6f92Rib3KjmKC9EmNRg}
GRAYLOG_PASSWORD=${GRAYLOG_PASSWORD:-$(echo -n password | shasum -a 256)}


sed -i "s/password_secret .*/password_secret = $GRAYLOG_SERVER_SECRET/" /etc/graylog/server/server.conf

sed -i "s/root_password_sha2 .*/root_password_sha2 = $GRAYLOG_PASSWORD/" /etc/graylog/server/server.conf

sed -i "s#^mongodb_uri .*#mongodb_uri = mongodb://mongo/graylog2#" /etc/graylog/server/server.conf

sed -i "s#^rest_listen_uri .*#rest_listen_uri = http://0.0.0.0:12900/#" /etc/graylog/server/server.conf

sed -i "s#.*elasticsearch_discovery_zen_ping_multicast_enabled.*#elasticsearch_discovery_zen_ping_multicast_enabled = false#" /etc/graylog/server/server.conf
sed -i "s#.*elasticsearch_discovery_zen_ping_unicast_hosts.*#elasticsearch_discovery_zen_ping_unicast_hosts = elastic:9300#" /etc/graylog/server/server.conf



/graylog2/bin/graylogctl run
