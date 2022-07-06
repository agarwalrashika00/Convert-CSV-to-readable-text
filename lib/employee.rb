class Employee
    attr_reader :name, :empid, :designation
    def initialize(name, empid, designation)
        @name = name
        @empid = empid
        @designation = designation
    end
end