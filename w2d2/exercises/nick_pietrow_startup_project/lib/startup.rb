require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(other_startup)
        @funding > other_startup.funding
    end

    def hire(name, title)
        if self.valid_title?(title)
            @employees << Employee.new(name, title)
        else
            raise "invalid title"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        pay_amt = @salaries[employee.title]
        if pay_amt < @funding
            employee.pay(pay_amt)
            @funding -= pay_amt
        else
            raise "we need some money"
        end
    end

    def payday
        @employees.each do |emp|
            self.pay_employee(emp)
        end
    end

    def average_salary
        sum = 0
        @employees.each do |emp|
            sum += salaries[emp.title]
        end
        sum / (@employees.length * 1.0)
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding
        other_startup.salaries.each do |title, salary|
            @salaries[title] = salary if !@salaries.has_key?(title)
        end
        @employees += other_startup.employees
        other_startup.close
    end
end
