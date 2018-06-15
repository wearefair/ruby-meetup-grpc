compile: stream_services_pb.rb

server: stream_services_pb.rb
	bundle exec ruby -I ./ server.rb

client: stream_services_pb.rb
	bundle exec ruby -I ./ client.rb


## Run the examples via docker.
## Run `make docker-build` first.

docker-server:
	docker run --rm --name ruby-meetup-grpc-streams ruby-meetup-grpc-streams

docker-client:
	docker run --network=container:ruby-meetup-grpc-streams ruby-meetup-grpc-streams bundle exec ruby -I ./ client.rb

docker-build: compile
	docker build -t ruby-meetup-grpc-streams .


## Compile the proto into Ruby code
stream_services_pb.rb:
	docker run -v $$(pwd):/defs namely/protoc-all:1.11 -f stream.proto -l ruby -o /defs

clean:
	rm -f stream_pb.rb stream_services_pb.rb 
