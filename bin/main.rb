require 'csv'
require_relative '../lib/employee.rb'
require_relative '../lib/csv_operations.rb'

csv_operations = CSVOperations.new("#{File.dirname(__FILE__)}/csv_file.csv", "#{File.dirname(__FILE__)}/output2.txt")
csv_operations.read_csv
csv_operations.write_to_file
