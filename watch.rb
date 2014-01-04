def run_if_changed(path, old_mtime, cmd)
  mtime = latest_mtime(path)
  if mtime > old_mtime
    puts "Failed: #{cmd}" unless system(cmd)    
  end
  mtime
end

def latest_mtime(path)
  if File.directory?(path)
    pattern = "#{path}/**/*"
    (Dir[pattern].map {|f| File.mtime(f)}).max
  else
    File.mtime(path)
  end
end

delay = 2

path = ARGV[0]
cmd = ARGV[1..-1].join(" ")

last_modified = Time.now

begin
  last_modified = run_if_changed(path, last_modified, cmd)
end while sleep delay
