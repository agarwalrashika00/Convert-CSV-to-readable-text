require 'csv'

class ModifyCSV
    def convert_csv_to_hash (csvfile, key_index)
        hash = Hash.new {|h,k| h[k]=[]}
        CSV.foreach(csvfile, headers:true) do |row|
            hash[row[key_index].strip] << [row[1].strip, row[0].strip]
        end
        hash
    end
end

class Hash
    def sort_hash_using_keys
        sort.to_h
    end

    def sort_hash_using_values
        to_a.map {|elem| [elem[0], elem[1].sort]}.to_h
    end

    def write_to_file(file_name)
        File.open(file_name, "w") do |file|
            each do |(key, value)|
                file.puts "#{key}#{'s' if value.length>1}"
                value.each {|each_value| 
                    file.puts "#{each_value[1]} (EmpId: #{each_value[0]})"
                }
                file.puts
            end
        end
    end
end

hash = ModifyCSV.new.convert_csv_to_hash("csv_file.csv", 2)
hash = hash.sort_hash_using_keys.sort_hash_using_values
hash.write_to_file("output.txt")
