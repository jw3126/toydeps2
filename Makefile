docker-build-make_deps:
	sudo docker build -t make_deps .

docker-run-make_deps:
	sudo docker run -v $(shell pwd):/app -it make_deps
