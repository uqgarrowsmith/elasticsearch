Elastic Search
=============

### Build docker image ###
`docker build --tag="uqgarrowsmith/elasticsearch" https://github.com/uqgarrowsmith/elasticsearch.git`

### Mount data ###
`docker run -v /usr/local/bin/docker:/docker -v /var/run/docker.sock:/docker.sock svendowideit/samba my-data`

### Elasticsearch 1.4.0 ###
`docker run -d -p 9200:9200 -p 9300:9300 -it --volumes-from my-data uqgarrowsmith/elasticsearch /elasticsearch/bin/elasticsearch -Des.config=/data/elasticsearch.yml`

### Handy urls ###
* Test: http://192.168.59.103:9200/_nodes/process?pretty
* Mapping: http://192.168.59.103:9200/_mapping
* Marvel: http://192.168.59.103:9200/_plugin/marvel/sense/index.html

### PreviousNext LAMP55 ###
`docker run -d -p 80:80 -p 222:22 -it --volumes-from my-data previousnext/lamp55`

`docker run -d -p 80:80 -p 222:22 -it --volumes-from my-data e091897def1a`


### Viewing the Web Application's Logs ###
docker logs -f apache-php.app1 

### Looking at our Web Application Container's processes ###
sudo docker top apache-php.app1 

On Windows:
cd /c/Users/admin/Dropbox/apps/Docker/lamp55
sudo docker build -t "uqgarrow/lamp55" .

### Data ###
docker run -v /data --name my-app busybox true
docker run --rm \
	-v /usr/local/bin/docker:/docker \
	-v /var/run/docker.sock:/docker.sock \
	svendowideit/samba \
	my-app
