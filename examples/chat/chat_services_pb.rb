# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: chat.proto for package ''

require 'grpc'
require 'chat_pb'

module Chat
  class Service

    include GRPC::GenericService

    self.marshal_class_method = :encode
    self.unmarshal_class_method = :decode
    self.service_name = 'Chat'

    rpc :SendAndReceive, stream(ChatMessage), stream(ChatMessage)
  end

  Stub = Service.rpc_stub_class
end
