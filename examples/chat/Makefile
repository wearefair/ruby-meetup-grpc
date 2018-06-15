compile: chat_services_pb.rb

server: person_services_pb.rb
	bundle exec ruby -I ./ server.rb

client: person_services_pb.rb
	bundle exec ruby -I ./ client.rb

# Run the python client
client-python: python/person_pb2_grpc.py
	cd python && python client.py


## Run the examples via docker.
## Run `make docker-build` first.

docker-server:
	docker run --rm --name ruby-meetup-grpc-services ruby-meetup-grpc-services

docker-client:
	docker run --network=container:ruby-meetup-grpc-services ruby-meetup-grpc-services bundle exec ruby -I ./ client.rb

docker-client-python:
	docker run --network=container:ruby-meetup-grpc-services ruby-meetup-grpc-services-python

docker-build: compile
	docker build -t ruby-meetup-grpc-services .
	docker build -t ruby-meetup-grpc-services-python -f python/Dockerfile python


## Compile the proto into Ruby code
chat_services_pb.rb:
	docker run -v $$(pwd):/defs namely/protoc-all:1.11 -f chat.proto -l ruby -o /defs

clean:
	rm -f person_pb.rb person_services_pb.rb python/person_pb2.py python/person_pb2_grpc.py
