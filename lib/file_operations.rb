class FileOperations
  def self.read_csv(csv_file)
    CSV.foreach(csv_file, headers: true) do |row|
    Employee.employee_list << Employee.new(row[0].strip, row[1].strip, row[2].strip)
    end
    Employee::employee_list.sort!
    Employee.group_by_designation
  end

  def self.write_to_file(filename, employee_hash)
    File.open(filename, 'w') do |file|
      employee_hash.each do |(designation, employees)|
        file.puts "#{designation}#{'s' if employees.length > 1}"
        employees.each do |each_employee|
          file.puts each_employee
        end
        file.puts
      end
    end
  end
end