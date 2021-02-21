#!/usr/bin/ruby
require 'stomp'

conf = {
  hosts: [{ host: "127.0.0.1", port: 61613, ssl:false}],
  stompconn: true,
  tcp_nodelay: true,
}

client = Stomp::Client.new(conf)

client.subscribe("/queue/mine.>") do |msg|
  puts "receive : " + msg.body.split(",")[0]
end
client.join


# see also.. wildcards https://activemq.apache.org/wildcards
