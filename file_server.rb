require 'webrick'
include WEBrick

dir = Dir::pwd
port = 3333

puts "URL: http://#{Socket.gethostname}:#{port}"

s = HTTPServer.new(
  :Port            => port,
  :DocumentRoot    => dir
)

trap("INT"){ s.shutdown }
s.start
