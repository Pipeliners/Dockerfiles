all:
	echo

build:
	cd /home/patrickmslattery/source/git/Pipeliners/Dockerfiles
	git pull
	docker build --tag registry.mywebgrocer.com/mywebgrocer/jenkins:latest jenkins
	docker tag registry.mywebgrocer.com/mywebgrocer/jenkins:latest registry.mywebgrocer.com/mywebgrocer/jenkins:1.594
	docker images | grep jenkins

pull:
	docker pull registry.mywebgrocer.com/mywebgrocer/jenkins

push:
	docker push registry.mywebgrocer.com/mywebgrocer/jenkins

ps:
	docker ps

info:
	docker info
