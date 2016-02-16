require "benchmark/ips"
require 'safe_clone'

def use_clone
  x = 42
  y = begin
        x.clone
      rescue
        x
      end
end

def use_safe_clone
  x = 42
  y = x.safe_clone
end

Benchmark.ips do |x|
  x.report("Clone with standard clone method") { use_clone }
  x.report("Clone with the safe clone method") { use_safe_clone }
  x.compare!
end
