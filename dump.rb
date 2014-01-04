contents = File.read(ARGV[0])

count = 0

contents.each_byte do |b|
  print b.to_s(16)
  print ' '
#  print b.chr.inspect
#  print ' '
  count += 1
  if count > 30
    puts
    count = 0
  end
end
puts


