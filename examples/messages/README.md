# Protobuf Message Demo

## Running the demo
You can run the demo directly, or via Docker

### Build & Run directly
We first need to compile the `person.proto` file into ruby code.

```shell
make compile
```

That will result in a new file `person_pb.rb`

You can then install the dependencies and run the demo

```shell
bundle && make run
```

### Build and Run via Docker
If you have Docker installed, you can run the demo by running

```shell
make docker-build docker-run
```
