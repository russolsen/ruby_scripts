# ruby-scripts 

This directory contains the handy Ruby scripts that
I like to have installed in my personal ~/bin directory.

The Rakefile takes care of copying each script over
to ~/bin, giving it an appropriate name (i.e. foo.rb
becomes ~/bin/foo).

The main thing is that the Rakefile also adds the
proper shebang line to the script, a line that
references a particular version of Ruby and a
particular gemset. To work, you need to have
RVM set up with this version of Ruby:

    ruby-2.0.0-p353

and this gemset

    myscripts

See the .ruby-version and .ruby-gemset files.

The trick is that RVM creates wrapper scripts for
every gem set that it knows about. The Rakefile inserts
a reference to the proper wrapper script into the shebang
line of each Ruby script.

Since running `rake` will copy all of the Ruby files
in this directory to your ~/bin directory. If that is
not what you want, don't run `rake`.
