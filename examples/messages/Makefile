compile: person_pb.rb

person_pb.rb:
	docker run -v $$(pwd):/defs namely/protoc-all:1.11 -f person.proto -l ruby -o /defs

run: person_pb.rb
	bundle exec ruby -I example.rb

docker-run:
	docker run ruby-meetup-grpc-message

docker-build: person_pb.rb
	docker build -t ruby-meetup-grpc-message .

clean:
	rm -f Gemfile.lock person_pb.rb
