class Employee

  def initialize(name, title, salary, boss_name = nil)
    @name = name
    @title = title
    @salary = salary
    @boss_name = boss_name
  end







  protected
  attr_reader :name, :title, :salary, :boss_name
end

class Manager < Employee

  def initialize(name, title, salary, employees = [], boss_name = nil)
    super(name, title, salary, boss_name)
    @employees = employees
  end

end