dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit", "type", "writer"]

def substrings (strings, dictionary)
  string_count = Hash.new(0)
  strings.each do |string|
    0.upto(string.length - 1) do |i|
      i.upto(string.length - 1) do |j|
        if dictionary.include?(string[i..j])
          string_count[string[i..j]] += 1
        end
      end
    end
  end
  string_count
end

string = "Howdy partner, sit down! How's it going?"
puts substrings(string.downcase.split, dictionary)