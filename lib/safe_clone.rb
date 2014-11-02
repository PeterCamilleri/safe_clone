require "safe_clone/version"

module SafeClone
  def safe_clone
    self
  end
end

class Object
  def safe_clone
    self.clone
  end
end

class Numeric
  include SafeClone
end

class NilClass
  include SafeClone
end

class TrueClass
  include SafeClone
end

class FalseClass
  include SafeClone
end

class Symbol
  include SafeClone
end

class Regexp
  include SafeClone
end

