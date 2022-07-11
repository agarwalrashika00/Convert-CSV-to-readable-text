class Employee
  attr_reader :name, :empid, :designation
  @@employee_list = []
  def self.employee_list
    @@employee_list
  end

  def initialize(name, empid, designation)
    @name = name
    @empid = empid
    @designation = designation
  end

  def <=>(other)
    designation <=> other.designation
  end

  def self.group_by_designation
    employee_list.group_by(&:designation)
  end

  def to_s
    "#{name} (EmpId: #{empid})"
  end
end