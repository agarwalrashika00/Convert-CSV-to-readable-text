require 'csv'
require './employee.rb'
require './read_and_write.rb'

ReadAndWrite.read_csv('../bin/csv_file.csv')
Employee.sort_by_designation
employee_hash = Employee.group_by_designation

ReadAndWrite.write_to_file('../bin/output2.txt', employee_hash)