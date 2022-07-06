require 'csv'
require './employee.rb'
require './employee_list.rb'

employee_list = EmployeeList.make_employee_list('../bin/csv_file.csv')

employee_list.sort_by!(&:designation)
employee_hash = employee_list.group_by(&:designation)

File.open('../bin/output2.txt',"w") do |fileptr|
    employee_hash.each do |(designation,employee)|
        fileptr.puts "#{designation}#{'s' if employee.length>1}"
        employee.each {|each_employee|
            fileptr.puts "#{each_employee.name} (EmpId: #{each_employee.empid})"
        }
        fileptr.puts
    end
end