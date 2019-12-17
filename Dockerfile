FROM docker.elastic.co/elasticsearch/elasticsearch-oss:7.2.1

# https://opendistro.github.io/for-elasticsearch-docs/docs/install/plugins/

RUN elasticsearch-plugin list \
  && elasticsearch-plugin install --silent --batch \
    https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/opendistro-security/opendistro_security-1.2.1.0.zip \
  && elasticsearch-plugin install --silent --batch \
    https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/opendistro-alerting/opendistro_alerting-1.2.1.0.zip \
  && elasticsearch-plugin install --silent \
    https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/opendistro-sql/opendistro_sql-1.2.1.0.zip \
  && elasticsearch-plugin install --silent --batch \
    https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/performance-analyzer/opendistro_performance_analyzer-1.2.1.0.zip \
  && elasticsearch-plugin list


# https://opendistro.github.io/for-elasticsearch-docs/docs/security-configuration/security-admin/
# https://github.com/opendistro-for-elasticsearch/security/blob/master/securityconfig/config.yml
#
# /usr/share/elasticsearch/jdk/bin/java \
#   -Dorg.apache.logging.log4j.simplelog.StatusLogger.level=OFF \
#   -cp /usr/share/elasticsearch/plugins/opendistro_security/*:/usr/share/elasticsearch/lib/*:/usr/share/elasticsearch/plugins/opendistro_security/deps/* \
#   com.amazon.opendistroforelasticsearch.security.tools.OpenDistroSecurityAdmin
#
# Open Distro Security Admin v7
# ERR: Parsing failed.  Reason: Specify at least -ks or -cert
