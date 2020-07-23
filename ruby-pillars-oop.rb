# Using abstraction, we hide the inner workings of a class
# and just reveal what is necessary. Allows us to hide the inner
# workings of a class
class Abstraction

  def initialize(param1, param2)
    @param1 = param1
    @param2 = param2
  end

  def simple_method
    p complicated_stuff
  end

  private

  def complicated_stuff
    ((@param1 + @param2) / 1000) * 555
  end
end

# OOP is defined by sending messages to objects
# object: a "thing" that can perform a set of activities. Eg: a "Student" object can tell you their name and year.

# Objects ask other objects to perform actions by sending messages. The requesting (sending) object is the sender
# while the receiving object is the receiver.
# - Control is given to the receiving object until it completes the command, upon which control returns
#   to the sending object.
# - 

# receiver: object on which we call the method
#   - eg: "string".reverse
#     - "string" is the receiver
# sender: object which invokes a method, in the example above, you the programmer are the sender
#
# How do receiving objects interpret messages from the senders? How are messages processed?
#   - Each message has code associated with it. When an object receives a message, code is executed. The
#     code associated with each message is called a method. 
#   - When an object receives a message, it determines which method is being requested and passes control to that method.
#   - Methods that operate on specific objects are instance methods
#   - Methods that operate on specfic classes are class methods
#
# OOP Problem Solving
# 1) Identify the problem
# 2) Identify the objects needed for the solution
# 3) Identify messages to be sent to the objects
# 4) Create a sequence of messages to the objects that solve the problem

# Encapsulation is the packing of data and methods into a single component. Means
# the internal representation of an object is hidden from the outside. The only thing
# one object knows about another object is the object's interface. The data and logic is
# hidden from other object. We can configure an object's interface through access control.
# Ruby has three types of methods: public, private, protected.
#   - public: accessable by everyone
#   - private: accessable only 
class Encapsulation
  attr_accessor :id

  def initialize(id)
    @id = id
  end

  def set_id(id)
    @id = id
  end
end

# Inheritance one of the pillars of OOP. It refers to the ability of
# one class to extend the abilities of another class in a hierarchical fashion.
# The new class is called the subclass, while the parent class is called the superclass.
# The subclass maintains all of the data and functionality of the superclass and
# can add addtional data and functionality to itself and its descendents.
class Inheritance
  def hello
    p "hello superclass"
  end

end

class Subclass < Inheritance
  def hello
    p "hello subclass"
  end
end

# Polymorphism means 'many forms' and refers to the ability of
# object-oriented languages to process objects differently based on 
# their type or class. Because OOP boils down to objects sending and receiving
# messages, polymorphism boils down to the abliity for two or more objects to
# respond to the same message. This allows a sending object to communicate with 
# different objects in a consistent manner.
#
# For example, an Animal class could be created, along
# with several subclasses inheriting from the Animal superclass, say: Cat,
# Dog, and Whale. Each of these classes could then define a talk method. Sending
# the same .talk message to an object of each of these classes will result in 
# a different result; this is an example of polymorphism.
#
class Polymorphism
end

class Animal < Polymorphism
  def talk
    p "i'm an animal"
  end
end

class Cat < Animal
  def talk
    p "Meow"
  end

end

class Dog < Animal
  def talk
    p "Woof"
  end
end

class Whale < Animal
  def talk
    p "eoooooeeeoo"
  end
end

Abstraction.new(12309283092304,40).simple_method
e = Encapsulation.new(10)
p e.send("id")
Inheritance.new.hello
Subclass.new.hello

