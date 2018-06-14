require 'grpc'
require 'log'
require 'person_services_pb'

client = PersonService::Stub.new('localhost:50051', :this_channel_is_insecure)

person = client.get_person(GetPersonRequest.new(id: 100))
log 'Got person 100', person

begin
  person = client.get_person(GetPersonRequest.new(id: 200))
rescue GRPC::NotFound => e
  log 'Got Error', e
end
