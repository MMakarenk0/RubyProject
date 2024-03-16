def getMatchingChars(value1, value2)
    matchingChars = []

    uniqValue1 = value1.chars.uniq.join().downcase
    uniqValue2 = value2.chars.uniq.join().downcase

    uniqValue1.each_char do |char|
        matchingChars << char if uniqValue2.include?(char) && char != ' '
    end
    return matchingChars
end

str1 = "Hello World!"
str2 = "Bye World!"

puts getMatchingChars(str1, str2).join(", ")