#
# ElasticSearch Dockerfile
# sudo docker build -t my_elasticsearch .
# https://github.com/dockerfile/elasticsearch
#

# Pull base image.
FROM dockerfile/java:oracle-java7

ENV ES_VERSION 1.4.2

# Install ElasticSearch.
RUN \
  cd /tmp && \
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz && \
  tar xvzf elasticsearch-$ES_VERSION.tar.gz && \
  rm -f elasticsearch-$ES_VERSION.tar.gz && \
  mv /tmp/elasticsearch-$ES_VERSION /elasticsearch

# http://192.168.59.103:9200/_plugin/marvel/sense/index.html
RUN /elasticsearch/bin/plugin -i elasticsearch/marvel/latest

# Define mountable directories.
VOLUME ["/data"]

# Mount elasticsearch.yml config
ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["/elasticsearch/bin/elasticsearch"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
