Elastic Search
=============

# Build docker image
`docker build -t uqgarrowsmith/elasticsearch https://github.com/uqgarrowsmith/elasticsearch.git`

# Mount data
`docker run -v /usr/local/bin/docker:/docker -v /var/run/docker.sock:/docker.sock svendowideit/samba my-data`

# Elasticsearch 1.4.0
`docker run -d -p 9200:9200 -p 9300:9300 -it --volumes-from my-data uqgarrowsmith/elasticsearch /elasticsearch/bin/elasticsearch -Des.config=/data/elasticsearch.yml`
