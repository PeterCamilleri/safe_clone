require "benchmark/ips"
require 'safe_clone'

class Array
  def use_clone
    self.map do |element|
      begin
        element.clone
      rescue TypeError
        element
      end
    end
  end

  def use_safe_clone
    self.map {|element| element.safe_clone }
  end
end

X = ["Test", :test, 43, true, nil, false]

Benchmark.ips do |x|
  x.report("Clone with standard clone method") { X.use_clone }
  x.report("Clone with the safe clone method") { X.use_safe_clone }
  x.compare!
end
