# ruby_activemq_stomp_study
### docker run
```
$ docker run -it -p 1883:1883 -p 5672:5672 -p 61613:61613 -p 61614:61614 -p 8161:8161 rmohr/activemq
```

### publisher.rb
```
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
```

### subscriber.rb
```
#!/usr/bin/ruby
require 'stomp'

conf = {
  hosts: [{ host: "127.0.0.1", port: 61613, ssl:false}],
  stompconn: true,
  tcp_nodelay: true,
}

client = Stomp::Client.new(conf)

client.subscribe("/queue/mine") do |msg|
  puts msg
end
client.join
```

## Copyright and license
Copyright (c) 2021 yoggy

Released under the [MIT license](LICENSE.txt)
