class Person
  def initialize(name,pps_number)
    @name  = name
    @pps_number = pps_number
  end
end

class Employee < Person
  def initialize(name,pps_number,hours,rate)
    super(name,pps_number)
    @hours = hours
    @rate = rate
  end
  def to_s
    @wages = @hours * @rate
    puts "#{@name} (PPSN: #{@pps_number}) earns €#{@wages} a week."
  end
end

class Manager < Employee
  def initialize(name,pps_number,hours,rate,bonus)
    super(name,pps_number,hours,rate)
    @bonus = bonus
  end
  def to_s
    @wages = (@hours * @rate) + @bonus
    puts "#{@name} (PPSN: #{@pps_number}) earns €#{@wages} a week, which includes a bonus of €#{@bonus}."
  end
end

class Volunteer < Employee
  def initialize(name,pps_number,hours,rate,name_o_charity)
    super(name,pps_number,hours,rate)
    @name_o_charity = name_o_charity
  end
  def to_s
    puts "#{@name} (PPSN: #{@pps_number}) works #{@hours} hours a week, representing #{@name_o_charity} charity."
  end
end

john = Employee.new('John',1234567,40,8)
aoife = Manager.new('Aoife',2323232 ,50, 12, 100)
jane = Volunteer.new('Jane',3434343,20,0, 'SVP')
puts john.to_s
puts aoife.to_s
puts jane.to_s