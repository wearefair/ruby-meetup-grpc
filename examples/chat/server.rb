require 'grpc'
require 'queue'
require 'chat_services_pb'

class ChatServicer < Chat::Service
  def initialize
    @chats = {}
  end

  def send_and_receive(requests, active_call)
    puts "Got request"
    responses = EnumeratorQueue.new()

    Thread.new do
      recipient = nil
      first = nil

      begin
        requests.each do |req|
          puts "Got new chat #{req.inspect}"
          if recipient.nil?
            first = req
            recipient = @chats.fetch(req.to, EnumeratorQueue.new())
            source = @chats.fetch(req.from, EnumeratorQueue.new())
            @chats[req.to] = recipient
            @chats[req.from] = source
            copy_queue(source, responses)
          end
          recipient.push(req)
        end

      ensure
        recipient.close()
        @chats.delete(first.to)
      end
    end

    responses.each_item
  end

  def copy_queue(src, dest)
    Thread.new do
      src.each_item.each do |item|
        dest.push(item)
      end
      dest.close()
    end
  end
end

server = GRPC::RpcServer.new
server.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
server.handle(ChatServicer)
puts "Starting server"
server.run
