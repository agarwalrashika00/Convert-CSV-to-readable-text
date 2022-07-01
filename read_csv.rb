class ModifyCSV
    def convert_csv_to_txt (csvfile)
        require 'csv'
        hash = Hash.new {|h,k| h[k]=[]}
        CSV.foreach(csvfile, headers:true) do |row|
            hash[row[2].strip] << [row[1].strip, row[0].strip]
        end
        hash = hash.sort.map {|elem| [elem[0], elem[1].sort]}.to_h
        
        File.open("output.txt", "w") do |file|
            hash.each do |(key, value)|
                file.puts "#{key}#{'s' if value.length>1}"
                value.each {|each_value| 
                    file.puts "#{each_value[1]} (EmpId: #{each_value[0]})"
                }
                file.puts
            end
        end
    end
end

ModifyCSV.new.convert_csv_to_txt("csv_file.csv")