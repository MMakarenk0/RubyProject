def processInteger(value)
    if value.is_a?(Integer) && value > 0 
        1.upto(value) do |i|
            puts "Current value: #{i}. Waiting #{i} seconds..."
            sleep i
        end
    else
        puts "Invalid value: #{value}"
    end
end

puts "Enter positive integer value: "
intValue = gets.chomp.to_i

processInteger(intValue)



