#!/bin/bash

GRAYLOG_SERVER_SECRET=${GRAYLOG_SERVER_SECRET:-82cqn9yshBFt98PQx2MLC60RTI0wc59TxC8OoPKTYgsiDrnRryzM7gvmrEkgSTeCCrEjmyQ23CNDi6f92Rib3KjmKC9EmNRg}
GRAYLOG_SERVER=${GRAYLOG_SERVER:-"http://graylog2:12900/"}


sed -i "s/application.secret.*/application.secret="$GRAYLOG_SERVER_SECRET"/" /graylog2/conf/graylog-web-interface.conf
sed -i "s#graylog2-server.uris.*#graylog2-server.uris=\"$GRAYLOG_SERVER\"#" /graylog2/conf/graylog-web-interface.conf


#sed -i "s/root_password_sha2 .*/root_password_sha2 = $GRAYLOG_SERVER_SECRET/" /etc/graylog/server/server.conf

#sed -i "s#^mongodb_uri .*#mongodb_uri = mongodb://mongo/graylog2#" /etc/graylog/server/server.conf

/graylog2/bin/graylog-web-interface
