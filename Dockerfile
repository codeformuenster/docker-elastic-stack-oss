FROM docker.elastic.co/elasticsearch/elasticsearch-oss:7.2.0

# https://opendistro.github.io/for-elasticsearch-docs/docs/install/plugins/

RUN elasticsearch-plugin list \
  && elasticsearch-plugin install --silent --batch \
    https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/opendistro-security/opendistro_security-1.2.0.0.zip \
  && elasticsearch-plugin install --silent --batch \
    https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/opendistro-alerting/opendistro_alerting-1.2.0.0.zip \
  && elasticsearch-plugin install --silent \
    https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/opendistro-sql/opendistro_sql-1.2.0.0.zip \
#  && elasticsearch-plugin install --silent --batch \
#    https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/performance-analyzer/opendistro_performance_analyzer-1.2.0.0.zip \
  && elasticsearch-plugin list

# opendistro_security needs some certs like:
# /usr/share/elasticsearch/config/root-ca.pem
# /usr/share/elasticsearch/config/node-key.pem
# /usr/share/elasticsearch/config/node.pem

# opendistro_performance_analyzer needs special settings for elasticsearch:
# -Djava.security.policy=file:///usr/share/elasticsearch/plugins/opendistro_performance_analyzer/pa_config/es_security.policy 
# -Dclk.tck=100 
# -Djdk.attach.allowAttachSelf=true
