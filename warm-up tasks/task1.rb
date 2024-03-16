numbersArray = []
10.times do
    numbersArray << rand(-10..10)
end

def getPositiveNumbers(array)
    count = 0
    array.each do |number|
        if number > 0
            count += 1
        end
    end
    return count
end

def getNegativeNumbers(array)
    count = 0
    array.each do |number|
        if number < 0
            count += 1
        end
    end
    return count
end

def getZeroesNumbers(array)
    count = 0
    array.each do |number|
        if number == 0
            count += 1
        end
    end
    return count
end

puts numbersArray.sort().join(", ")

puts "Positive numbers: #{getPositiveNumbers(numbersArray)}"
puts "Negative numbers: #{getNegativeNumbers(numbersArray)}"
puts "Zeroes numbers: #{getZeroesNumbers(numbersArray)}"
puts "Min number: #{numbersArray.min}"
puts "Max number: #{numbersArray.max}"
