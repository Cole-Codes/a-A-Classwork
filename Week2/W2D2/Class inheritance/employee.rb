class Employee

  attr_reader :name, :title, :salary
  attr_accessor :boss

  def initialize(name, title, salary, boss = nil)
    @name = name 
    @title = title
    @salary = salary
    self.boss = boss
  end 

  def boss=(boss)
    @boss = boss
    boss.add_employee(self) if !boss.nil?
  end

  def bonus(multiplier)
    bonus = salary * multiplier
    bonus
  end

end

class Manager < Employee

  attr_reader :employees, :bonus

  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @employees = []
  end 

  def add_employee(new_employee)
    @employees << new_employee
  end

  def bonus(multiplier)
    bonus = 0
    all_sub_employee.each do |sub_employee| 
      bonus += sub_employee.salary 
    end
    bonus *= multiplier
    bonus
  end

  def all_sub_employee
    ans = []
    queue = employees
    until queue.empty?
      cur_employee = queue.shift
      ans << cur_employee
      queue.concat(cur_employee.employees) if cur_employee.is_a?(Manager)
    end
    ans
  end

end

ned = Manager.new('Ned', 'Founder', 1000000)
darren = Manager.new('Darren', 'TA Manager', 78000, ned)
shawna = Employee.new('Shawna', 'TA', 12000, darren)
david = Employee.new('David', 'TA', 10000, darren)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)