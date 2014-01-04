require 'csv'

convert_header = lambda {|h| h.to_sym}

CSV.foreach(ARGV[0], :headers=>true, :header_converters => convert_header) do |row|
  row.each {|k, v| puts "#{k}: #{v}"}
  puts
  puts
end
