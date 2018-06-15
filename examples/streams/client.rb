require 'grpc'
require 'logger'
require 'queue'
require 'stream_services_pb'

STDOUT.sync = true
logger = Logger.new STDOUT
client = StreamingEcho::Stub.new 'localhost:50051', :this_channel_is_insecure

# Create a queue to push requests to
requests = EnumeratorQueue.new

# Start the request (the queue can be empty)
logger.info 'starting request'
responses = client.echo(requests.each_item)
logger.info 'got response queue'

# Start publishing requests in a new thread
Thread.new do
  (1..5).each do |number|
    logger.info "creating request for number #{number}"
    requests.push EchoMessage.new(msg: "number #{number}")
    sleep 3
  end
  requests.close
end

# and read the responses on the main thread
responses.each do |response|
  logger.info "Got response: #{response.msg}"
end
logger.info 'request finished'
