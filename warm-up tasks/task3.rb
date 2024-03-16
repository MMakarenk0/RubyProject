str = "ABCD"

def reverse0(value)
    return value.reverse
end

def reverse1(value)
    return value.chars.reverse.join
end

def reverse2(value)
    reversedStr = ""
    value.chars.reverse_each do |char|
        reversedStr << char
    end
    return reversedStr
end

def reverse3(value)
    reversedStr = ""
    value.length.times do |i|
        reversedStr << value[value.length - 1 - i]
    end
    return reversedStr
end

def reverse4(value)
    if value.length == 1
        return value
    end
    return value[-1] + reverse4(value[0..-2])
end

puts reverse0(str)
puts reverse1(str)
puts reverse2(str)
puts reverse3(str)
puts reverse4(str)