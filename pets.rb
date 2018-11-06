# 16382333 Anna Davison
class Pets
  def speak
    puts "noise"
  end

  def daily_routine
    puts "I am a #{self.class.name}"
    puts "I eat meat"
    3.times do
      self.speak
    end
    puts "I sleep in my kennel"
  end

end

class Cat < Pets
  def speak
    puts "Meeow!"
  end
end

class Dog < Pets
  def speak
    puts "Woof!"
  end
end

class Rodents < Pets
  def speak
    puts "Squeak!"
  end
end

class Mouse < Rodents

end

class Gerbil < Rodents

end

class Fox < Pets

end

class PetLover
  def initialize
    @array = Array.new
  end

  def fill_array
    cat = Cat.new
    dog = Dog.new
    mouse = Mouse.new
    gerbil = Gerbil.new
    fox = Fox.new

    10.times do
      number = rand(5)

      case number
      when 0
        @array.push cat
      when 1
        @array.push dog
      when 2
        @array.push mouse
      when 3
        @array.push gerbil
      when 4
        @array.push fox
      end
    end

  end

  def all_speak
    i = 0
    loop do
    animal = @array[i]
    animal.daily_routine
    i+=1
    if i == 10
      break
     end
    end
  end
end

now = PetLover.new
now.fill_array
now.all_speak

# Question 1: You don't need to give the pet classes a common super class because of duck typing.  You have to do this in java
# because java doesn't have duck typing.  It uses an abstract method.

# Question 2: We used inheritance here so that we could have default values for the speak method for the animals which
# will mean the code will run with less errors.  It also enables you to avoid code duplication by making more subclasses
# eg the Rodents class.
