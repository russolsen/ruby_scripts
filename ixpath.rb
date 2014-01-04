require 'rexml/document'

doc = REXML::Document.new(File.new(ARGV.shift))

root = doc.root

print "ixpath> "
until $stdin.eof?
  xpath = $stdin.readline.strip
  puts REXML::XPath.first(doc, xpath)
  print "ixpath> "
end
