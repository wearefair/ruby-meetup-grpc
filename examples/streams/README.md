# Bi-directional Streams Demo

## Running the demo
You can run the demo directly, or via Docker

### Build & Run directly

#### Compiling the protos
We first need to compile the `stream.proto` file into ruby code.

```shell
make compile
```

That will result in a new files

- `stream_pb.rb`
- `stream_services_pb.rb` ruby gRPC client/server stubs

You can then install the dependencies and run the demo

#### Install Dependencies

Run `bundle install`.

#### Run the Clients/Servers

Start the server with `make server`, and the ruby client with `make client`.


### Build and Run via Docker
If you have Docker installed, you can run the demo by running

- `make docker-build`
- `make docker-server`
- `make docker-client`
