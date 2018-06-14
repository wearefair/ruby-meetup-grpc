require 'grpc'
require 'log'
require 'person_services_pb'

class PersonServicer < PersonService::Service
  def initialize
    @people_db = {100 => Person.new(name: 'marshall', id: 100, email: 'marshall@email.com')}
  end

  def get_person(request, active_call)
    log 'Got request', request
    person = @people_db[request.id]
    raise GRPC::NotFound, "Person #{request.id} does not exist" unless person
    person
  end
end

server = GRPC::RpcServer.new
server.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
server.handle(PersonServicer)
puts "Starting server"
server.run
