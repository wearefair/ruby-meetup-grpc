# Protobuf Service Demo

## Running the demo
You can run the demo directly, or via Docker

### Build & Run directly

#### Compiling the protos
We first need to compile the `person.proto` file into ruby and python code.

```shell
make compile
```

That will result in a new files

- `person_pb.rb`
- `person_services_pb.rb` ruby gRPC client/server stubs
- `python/person_pb2.py`
- `python/person_pb2_grpc.py` python gRPC client/server stubs

You can then install the dependencies and run the demo

#### Install Dependencies

For the ruby dependencies run `bundle install`.

For the python dependencies run `pip install -r python/requirements.txt`.

#### Run the Clients/Servers

Start the server with `make server`, and the ruby client with `make client`.

You can also run the python client with `make client-python`.

### Build and Run via Docker
If you have Docker installed, you can run the demo by running

- `make docker-build`
- `make docker-server`
- `make docker-client`
- `make docker-client-python`
