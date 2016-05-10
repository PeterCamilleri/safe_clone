require 'rake/testtask'
require "bundler/gem_tasks"

#Run the unit test suite.
Rake::TestTask.new do |t|
  #List out all the test files.
  t.test_files = ["test/safe_clone_tests.rb"]
  t.verbose    = false
end

desc "What version of full_clone is this?"
task :vers do |t|
  puts
  puts "safe_clone version = #{SafeClone::VERSION}"
end

