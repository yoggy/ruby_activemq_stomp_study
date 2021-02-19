#!/usr/bin/ruby
require 'stomp'

conf = {
  hosts: [{ host: "127.0.0.1", port: 61613, ssl:false}],
  stompconn: true,
  tcp_nodelay: true,
}

client = Stomp::Client.new(conf)

count = 0
loop do 
  msg = "count=#{count}"
  puts "publish msg=#{msg}"
  client.publish("/queue/mine", msg)
  sleep 0.5
  count += 1
end

