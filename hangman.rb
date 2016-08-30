def text_correct_size?(word)
  TRUE if (word.length >= 5 && word.length <= 12)
end

dictionary = File.readlines('5desk.txt').each { |word| word.gsub!(/\r\n/, "") }

dictionary.delete_if { |word| text_correct_size?(word) != TRUE}

puts dictionary
