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

Further, when benchmarked under

    ruby 1.9.3p484 (2013-11-22) [i386-mingw32]

the following results are observed:

    C:\Sites\safe_clone>ruby bench\bench.rb
    Warming up --------------------------------------
    Clone with standard clone method
                             6.424k i/100ms
    Clone with the safe clone method
                            97.476k i/100ms
    Calculating -------------------------------------
    Clone with standard clone method
                             72.460k (± 8.5%) i/s -    366.168k
    Clone with the safe clone method
                              4.690M (±33.3%) i/s -     20.957M

    Comparison:
    Clone with the safe clone method:  4690305.8 i/s
    Clone with standard clone method:    72460.2 i/s - 64.73x slower

With:

    ruby 2.1.6p336 (2015-04-13 revision 50298) [i386-mingw32]

the following results are observed:

    C:\Sites\safe_clone>ruby bench\bench.rb
    Warming up --------------------------------------
    Clone with standard clone method
                            20.607k i/100ms
    Clone with the safe clone method
                           107.236k i/100ms
    Calculating -------------------------------------
    Clone with standard clone method
                            298.041k (±11.1%) i/s -      1.484M
    Clone with the safe clone method
                              4.934M (±34.5%) i/s -     22.091M

    Comparison:
    Clone with the safe clone method:  4933871.9 i/s
    Clone with standard clone method:   298041.4 i/s - 16.55x slower

And with:

    ruby 2.2.3p173 (2015-08-18 revision 51636) [i386-cygwin]

we get:

    $ ruby bench/bench.rb
    Warming up --------------------------------------
    Clone with standard clone method
                            15.876k i/100ms
    Clone with the safe clone method
                            70.638k i/100ms
    Calculating -------------------------------------
    Clone with standard clone method
                            219.593k (±10.7%) i/s -      1.095M
    Clone with the safe clone method
                              4.525M (± 0.9%) i/s -     22.675M

    Comparison:
    Clone with the safe clone method:  4524862.8 i/s
    Clone with standard clone method:   219593.0 i/s - 20.61x slower


Overall: Shorter code  _and_ faster. Winner, winner, chicken dinner!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
