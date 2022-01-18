class Employee

  def initialize(name, title, salary, boss_name = nil)
    @name = name
    @title = title
    @salary = salary
    @boss_name = boss_name
  end

  def bonus(multiplier)
    self.salary * multiplier
  end

  protected
  attr_reader :name, :title, :salary, :boss_name
end

class Manager < Employee

  def initialize(name, title, salary, employees = [], boss_name = nil)
    super(name, title, salary, boss_name)
    @employees = employees
  end

  def bonus(multiplier)
    total = 0
    queue = Queue.new
    employees.each do |employee| 
      total += employee.salary
    end
    total * multiplier
  end

end

david = Employee.new("david","TA",10000,"darren")
shawna = Employee.new("shawna","TA",12000,"darren")
darren = Manager.new("darren","TA Manager",78000,[david,shawna],"ned")
ned = Manager.new("ned","Founder",1000000,[darren])

ned.bonus(5) # => 500_000
darren.bonus(4) # => 88_000
david.bonus(3) # => 30_000
