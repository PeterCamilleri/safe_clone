# SafeClone

This tiny gem implements a version of clone called safe\_clone. Unlike the
standard clone method, the safe\_clone method does not throw an exception
when sent to un-clonable value objects like 42 or true. These values simply
return themselves. This is correct because those types of objects do not _need_
to be cloned. Instead of having a fit, the code just works!

## Installation

Add this line to your application's Gemfile:

    gem 'safe_clone'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install safe_clone

## Usage

    require 'safe_clone'

then, in those places where regular clone was problematic, use:

    foo = my_object.safe_clone

instead of

    begin
      foo = my_object.clone
    rescue TypeError
      foo = my_object
    end

## Performance
A reasonable question to raise is "How does safe clone compare with just
catching the exception and handling it?" The benchmark sets a a realistic
scenario where an array (whose contents may be varied) is having its
_contents_ cloned. The benchmarking code follows:

```ruby
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
```

Ruby Version:

    ruby 1.9.3p484 (2013-11-22) [i386-mingw32]

Results:

    C:\Sites\safe_clone>ruby bench\bench.rb
    Warming up --------------------------------------
    Clone with standard clone method
                             1.247k i/100ms
    Clone with the safe clone method
                            35.027k i/100ms
    Calculating -------------------------------------
    Clone with standard clone method
                             12.957k (± 5.8%) i/s -     64.844k
    Clone with the safe clone method
                            534.740k (± 8.9%) i/s -      2.662M

    Comparison:
    Clone with the safe clone method:   534740.1 i/s
    Clone with standard clone method:    12956.6 i/s - 41.27x slower

Ruby Version:

    ruby 2.1.6p336 (2015-04-13 revision 50298) [i386-mingw32]

Results:

    C:\Sites\safe_clone>ruby bench\bench.rb
    Warming up --------------------------------------
    Clone with standard clone method
                             4.945k i/100ms
    Clone with the safe clone method
                            38.109k i/100ms
    Calculating -------------------------------------
    Clone with standard clone method
                             54.491k (± 7.3%) i/s -    271.975k
    Clone with the safe clone method
                            569.236k (±10.2%) i/s -      2.820M

    Comparison:
    Clone with the safe clone method:   569236.4 i/s
    Clone with standard clone method:    54491.3 i/s - 10.45x slower

Ruby Version:

    ruby 2.2.3p173 (2015-08-18 revision 51636) [i386-cygwin]

Results:

    Peter Camilleri@NCC1701G /cygdrive/c/sites/safe_clone
    $ ruby bench/bench.rb
    Warming up --------------------------------------
    Clone with standard clone method
                             3.698k i/100ms
    Clone with the safe clone method
                            28.999k i/100ms
    Calculating -------------------------------------
    Clone with standard clone method
                             40.076k (± 5.1%) i/s -    203.390k
    Clone with the safe clone method
                            481.524k (±10.0%) i/s -      2.407M

    Comparison:
    Clone with the safe clone method:   481524.1 i/s
    Clone with standard clone method:    40075.6 i/s - 12.02x slower


Overall: Shorter code  _and_ faster. Winner, winner, chicken dinner!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
