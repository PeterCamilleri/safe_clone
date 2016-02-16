require "safe_clone/version"

class Object
  #By default, reference types use the clone method.
  def safe_clone; self.clone; end
end

#For value types, just return self!
module SafeClone
  def safe_clone; self; end
end

#Update the Ruby value types.
class Numeric;    include SafeClone; end
class NilClass;   include SafeClone; end
class TrueClass;  include SafeClone; end
class FalseClass; include SafeClone; end
class Symbol;     include SafeClone; end
class Regexp;     include SafeClone; end
