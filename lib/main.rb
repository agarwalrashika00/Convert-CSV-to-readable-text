require 'csv'
require_relative './employee.rb'
require_relative './file_operations.rb'

begin
    employee_hash = FileOperations.read_csv('E:\Desktop\Vinsol\ruby exercises\CSV2\bin\csv_file.csv')
    FileOperations.write_to_file('E:\Desktop\Vinsol\ruby exercises\CSV2\bin\output2.txt', employee_hash)
rescue Errno::ENOENT
    puts "file not found"
end