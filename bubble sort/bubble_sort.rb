def bubble_sort (array)
  placeholder = 0
  (array.length - 1).downto(0) do |i|
    0.upto(array[0..i].length - 1) do |j|
      comparison = array[j] <=> array[j + 1]
      if comparison == 1
        placeholder = array[j]
        array[j] = array[j + 1]
        array[j + 1] = placeholder
      end
    end
  end
  array
end

puts bubble_sort([4,3,78,2,0,2])
