# Types are not declared in Ruby. Everything is 
# some type of object. In Ruby, we rely less on the type/Class of an object
# and more on its capabilities. In Duck Typing, a object type is defined by what
# it can do, not by what it is. 
#
# This term is used in dynamic languages that do not have strong typing. Comes from
# the phrase "If it looks like a duck and quacks like a duck, it's a duck"
class Duck
  def quack
    'Quack!'
  end
end

class DuckRecording
  def quack
    'Quack!!'
  end
end

def make_it_quack(duck)
  duck.quack
end

p make_it_quack(Duck.new)
p make_it_quack(DuckRecording.new)
