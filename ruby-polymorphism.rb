# Polymorphism - Means "Many forms"

# 1. Class Inheritance is the most common and basic form of polymorphism

class Animal
  def name
    raise NotImplementedError, 'An animal must have a name'
  end
end

class Dog < Animal
  def name
    p "I'm a dog"
  end
end

class Cat < Animal
  def name
    p "I'm a cat"
  end
end

Dog.new.name
Cat.new.name

# 2. Replacing conditionals with polymorphism

class PolyConditionalEmployee
  def introduce(type)
    if type == "part-time"
      p "I'm a part-time employee"
    elsif type == "full-time"
      p "I'm a full-time employee"
    elsif type == "intern"
      p "I'm an intern"
    end
  end
end

PolyConditionalEmployee.new.introduce("part-time")

class PolymorphicEmployee
  def introduce
    raise NotImplementedError, 'An employee must implement the .introduce method'
  end
end

class PartTime < PolymorphicEmployee
  def introduce
    p "I'm a part-time employee"
  end
end

class FullTime < PolymorphicEmployee
  def introduce
    p "I'm a full-time employee"
  end
end

class Intern < PolymorphicEmployee
  def introduce
    p "I'm an intern"
  end
end

Intern.new.introduce




class GenericParser
  # This method is an example of polymorphism. It acts differently
  # depending on the type of object that is passed to it
  def parse(parser)
    parser.parse
  end
end

class JsonParser
  def parse
    p "An instance of JsonParser class received the parse message"
  end
end

parser = GenericParser.new
parser.parse(JsonParser.new)

# Decorator pattern

class Parser
  def parse
    puts "The parser class received the parse method"
  end
end

