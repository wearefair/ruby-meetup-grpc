# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: stream.proto for package ''

require 'grpc'
require 'stream_pb'

module StreamingEcho
  class Service

    include GRPC::GenericService

    self.marshal_class_method = :encode
    self.unmarshal_class_method = :decode
    self.service_name = 'StreamingEcho'

    rpc :Echo, stream(EchoMessage), stream(EchoMessage)
  end

  Stub = Service.rpc_stub_class
end
