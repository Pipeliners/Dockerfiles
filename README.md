Dockerfiles
===========

A collection of any Dockerfiles we need

####Build Instructions

##### Build CentOS Up2Date
```shell
docker \
  build \
  --rm \
  --tag registry.mywebgrocer.com/mywebgrocer/centos7_u2d:latest \
  https://raw.githubusercontent.com/patrickmslatteryvt/dockerfiles/master/centos7_u2d/Dockerfile
```

##### Build java8_oracle
```shell
docker \
  build \
  --tag registry.mywebgrocer.com/mywebgrocer/java8_oracle:latest \
  https://raw.githubusercontent.com/patrickmslatteryvt/dockerfiles/master/java/oracle-java8/Dockerfile
```

##### Build Nginx
```shell
docker \
  build \
  --rm \
  --tag registry.mywebgrocer.com/mywebgrocer/nginx:1.6.2 \
  https://raw.githubusercontent.com/patrickmslatteryvt/dockerfiles/master/nginx/Dockerfile
```

##### Build Jenkins
```shell
docker \
  build \
  --rm \
  --tag registry.mywebgrocer.com/mywebgrocer/jenkins:1.594 \
  https://raw.githubusercontent.com/Pipeliners/Dockerfiles/master/jenkins/Dockerfile
```

```shell
mkdir -p /srv/nginx/conf.d
curl --location https://raw.githubusercontent.com/patrickmslatteryvt/dockerfiles/master/nginx/etc/nginx/conf.d/jenkins.conf --output /srv/nginx/conf.d/jenkins.conf -#
curl --location https://raw.githubusercontent.com/patrickmslatteryvt/dockerfiles/master/nginx/etc/nginx/conf.d/chef.conf --output /srv/nginx/conf.d/chef.conf -#
touch /srv/nginx/conf.d/nginx_confs_go_here
```

##### Start Jenkins
```shell
docker \
  run \
  --detach \
  --hostname jenkins_chef \
  --name jenkins_chef \
  --publish 8081:8080 \
  --publish 50000:50000 \
  registry.mywebgrocer.com/mywebgrocer/jenkins:1.594;
```

##### Start Nginx
```shell
docker \
  run \
  --detach \
  --hostname nginx \
  --link jenkins_chef:chef \
  --name nginx \
  --publish 80:80 \
  --privileged \
  --publish 443:443 \
  --volume /srv/nginx/conf.d:/etc/nginx/conf.d:ro \
  registry.mywebgrocer.com/mywebgrocer/nginx:1.6.2;
```

##### List the files in /etc/nginx/conf.d
```shell
docker \
  exec \
  nginx \
  ls -la /etc/nginx/conf.d/
```
