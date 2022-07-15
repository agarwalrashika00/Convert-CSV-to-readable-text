class CSVOperations
  def initialize(csv_file, output_file)
    @employee_hash ={}
    @csv_file = csv_file
    @output_file = output_file
  end

  def read_csv
    begin
      employee_list = []
      CSV.foreach(@csv_file, headers: true) do |row|
      employee_list << Employee.new(row[0].strip, row[1].strip, row[2].strip)
      end
      employee_list.sort!
      @employee_hash = Employee.group_by_designation(employee_list)
    rescue Errno::ENOENT
      puts 'file not found'
    end
  end

  def write_to_file
    File.open(@output_file , 'w') do |file|
      @employee_hash.each do |(designation, employees)|
        file.puts "#{designation}#{'s' if employees.length > 1}"
        employees.each do |each_employee|
          file.puts each_employee
        end
        file.puts
      end
    end
  end
end