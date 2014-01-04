HOME=ENV["HOME"]

BIN_DIR="#{HOME}/bin"

RUBY_EXECUTABLE="#{HOME}/.rvm/wrappers/ruby-2.0.0-p353@myscripts/ruby"
SCRIPTS=Dir['*.rb']

SCRIPTS.each do |script|
  installed_path = script.pathmap("#{BIN_DIR}/%n")

  task installed_path => script do
    puts "Creating #{installed_path}"
    File.open(installed_path, 'w') do |f|
      f.puts "#!/usr/bin/env #{RUBY_EXECUTABLE}"
      f.puts File.read(script)
    end
    chmod 0755, installed_path
  end

  task :install => installed_path
end

task :default => :install


