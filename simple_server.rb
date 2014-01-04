#!/usr/bin/env ruby

require 'webrick'
require 'pp'

class Simple < WEBrick::HTTPServlet::AbstractServlet
  
  def do_GET(request, response)
    do_IT(request, response)
  end

  def do_POST(request, response)
    do_IT(request, response)
  end

  def do_PUT(request, response)
    do_IT(request, response)
  end

  def do_DELETE(request, response)
    do_IT(request, response)
  end

  def do_IT(request, response)
    puts "HEADERS"
    request.each {|name, value| puts "#{name} => #{value}"}
    puts "BODY"
    puts request.body
  end
  
end

port = ARGV[0].to_i
puts port

s = WEBrick::HTTPServer.new(:Port=>port)
s.mount("/", Simple)

trap("INT"){ s.shutdown }
s.start
