# coding: utf-8
# An IRB + safe_clone test bed

require 'irb'

puts "Starting an IRB console with safe_clone loaded."

if ARGV[0] == 'local'
  require_relative 'lib/safe_clone'
  puts "safe_clone loaded locally: #{SafeClone::VERSION}"

  ARGV.shift
else
  require 'safe_clone'
  puts "safe_clone loaded from gem: #{SafeClone::VERSION}"
end

IRB.start
