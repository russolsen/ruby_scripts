require 'csv'
require 'net/http'
require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'uri'
require 'pp'

def parse_args(args)
  options = OpenStruct.new
  options.test = false
  options.log = true
  options.logfile = "grab.txt"
  options.descrption = ""

  opt_parser = OptionParser.new do |opts|
    opts.banner = "Usage: grab [options] url"

    opts.on('-d desc', "--description desc",
            "Add a description to the log file") do |desc|
      options.description = desc
    end

    opts.on("--logfile LOGFILE",
            "Record downloaded files to LOGFILE") do |path|
      options.logfile = path
    end

    opts.on("-t", "--[no-]test", "Test mode - Just print out options but dont do anything") do |flag|
      options.test = flag
    end

    opts.on("-l", "--[no-]log", "Log downloads") do |flag|
      options.log = flag
    end
  end

  opt_parser.parse!(args)

  options.uri = URI.parse(args.shift)

  if args.empty?
    uri_path = options.uri.path
    options.path = File.basename(uri_path)
    options.path = 'grab.out' if options.path.nil? or options.path.empty?
  else
    options.path = args.shift
  end
 
  options
end

def log(options)
  return unless options.log

  CSV.open(options.logfile, 'a') do |csv|
    csv << [ Time.now, options.uri, options.path, options.description ]
  end
end

options = parse_args(ARGV)

if options.test
  pp options
else
  content = Net::HTTP.get(options.uri)
  File.open(options.path, 'w') {|f| f.write(content) }
  content = Net::HTTP.get(options.uri)
  log(options)
end
