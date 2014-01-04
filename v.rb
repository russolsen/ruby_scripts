args = ARGV.dup
file = args.pop

path, line = file.split(':')

if line.nil?
  exec("vim", *ARGV)
else
  args << "+#{line}"
  args << path
  exec("vim", *args)
end
