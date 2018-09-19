# coding: utf-8

require_relative "safe_clone/version"

# The default safe clone is Ruby clone.
class Object
  #By default, reference types use the clone method.
  def safe_clone
    clone
  end
end

# For value types, safe clone just returns self.
module SafeClone
  def safe_clone
    self
  end
end

# Numeric does safe clone.
class Numeric
  include SafeClone
end

# NilClass does safe clone.
class NilClass
  include SafeClone
end

# TrueClass does safe clone.
class TrueClass
  include SafeClone
end

# FalseClass does safe clone.
class FalseClass
  include SafeClone
end

# Symbols do safe clone.
class Symbol
  include SafeClone
end

# Regular expressions do safe clone.
class Regexp
  include SafeClone
end

# Threads do safe clone.
class Thread
  include SafeClone
end
