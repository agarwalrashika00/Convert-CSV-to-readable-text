class EmployeeList
    def self.make_employee_list(csv_file)
        employee_list = []
        CSV.foreach(csv_file, headers:true) do |row|
            employee_list << Employee.new(row[0].strip,row[1].strip,row[2].strip)
        end
        employee_list
    end
end