ARGV.each do |f|
  line_number = 1
  File.open(f).each_line do |l|
    char_number = 1
    l.each_byte do |ch|
      puts "File: #{f} Line #{line_number} char #{char_number}" if ch > 128 || ch < 1
      char_number += 1
    end
    line_number += 1
  end
end
