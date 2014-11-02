# SafeClone

This tiny gem implements a version of clone called safe_clone. Unlike the
standard clone method, the safe_clone method does not throw ant exception
when sent to un-clonable objects like 42 or true. These simply return
themselves and this is correct because those types of objects do not NEED
to be cloned. Instead of blowing up in a hissy fit, the code just works!

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

    foo = my_object.clone


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
