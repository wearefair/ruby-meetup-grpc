require 'grpc'
require 'queue'
require 'chat_services_pb'

puts "Enter your name"
from = gets.chomp
puts "Enter the recipient name"
to = gets.chomp

client = Chat::Stub.new('localhost:50051', :this_channel_is_insecure)


requests = EnumeratorQueue.new
responses = client.send_and_receive(requests.each_item)
requests.push(ChatMessage.new(to: to, from: from))

Thread.new do
  loop do
    puts ">"
    body = gets.chomp
    # puts "\n[#{from}] #{body}"
    requests.push(ChatMessage.new(to: to, from: from, body: body))
  end
end

responses.each do |msg|
  puts "\n[#{msg.from}] #{msg.body}"
end
