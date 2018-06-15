require 'grpc'
require 'logger'
require 'queue'
require 'stream_services_pb.rb'

STDOUT.sync = true
logger = Logger.new STDOUT

class EchoServicer < StreamingEcho::Service
  def initialize(logger)
    @logger = logger
  end

  def echo(requests)
    @logger.info 'started request'

    # create a queue to publish responses to
    queue = ::EnumeratorQueue.new

    # Start a thread to read requests, and publish responses into the queue
    Thread.new do
      requests.each do |request|
        @logger.info "Request message: #{request.msg}"
        queue.push EchoMessage.new(msg: "Got message: #{request.msg}")
        sleep 1
        queue.push EchoMessage.new(msg: "Sending copy: #{request.msg}")
      end
      
      # End the queue by passing the termination object
      @logger.info 'Finished processing requests'
      queue.close
    end

    # Return an interator from the queue
    queue.each_item
  end
end

server = GRPC::RpcServer.new
server.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
server.handle EchoServicer.new(logger)
logger.info 'starting server'
server.run
