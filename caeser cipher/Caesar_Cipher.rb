def ciphering_the_text (word, key)
  # rotating the key 
  if key > 26
    key %= 26
  end

  word.map do |character|
    if character.ord.between?("A".ord, "Z".ord)
      if character.ord + key > "Z".ord
        # 65 - 1 + (character.ord + the key) % 90
        ('A'.ord - 1 + (character.ord + key) % "Z".ord).chr
      else
        (character.ord + key).chr
      end
    elsif character.ord.between?("a".ord, "z".ord)
      if character.ord + key > 122
        ('a'.ord - 1 + (character.ord + key) % "z".ord).chr
      else
        (character.ord + key).chr
      end
    else
      character
    end
  end
end

word = ""
key = 0
while word == ""
  puts "Enter the word: "
  word = STDIN.gets.chomp
end
while key <= 0 or key.class == 'String'
  puts "Enter the key: "
  key = STDIN.gets.chomp.to_i
end

puts ciphering_the_text(word.split(''), key).join
