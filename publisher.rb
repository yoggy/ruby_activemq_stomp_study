#!/usr/bin/ruby
require 'stomp'

conf = {
  hosts: [{host: "127.0.0.1", port: 61613, ssl:false}],
  stompconn: true,
  tcp_nodelay: true,
}

client = Stomp::Client.new(conf)

count = 0
payload_size = 1 * 1024 * 1024
payload = "a" * payload_size

loop do 
  msg = "a_count=#{count}"
  puts "publish msg=#{msg}"
  client.publish("/queue/mine.a", msg + "," + payload)

  msg = "b_count=#{count}"
  puts "publish msg=#{msg}"
  client.publish("/queue/mine.b", msg + "," + payload)
#  sleep 0.5
  count += 1
end

