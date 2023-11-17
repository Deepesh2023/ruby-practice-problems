def stock_picker (stocks)
  # create an array for each stock with their best selling day profit
  price_difference = Array.new
  0.upto(stocks.length - 1) do |i|
    price_difference.push(stocks[i..stocks.length - 1].max - stocks[i])
  end
  buying_day = price_difference.index(price_difference.max)
  selling_day = stocks.index(price_difference.max + stocks[buying_day])

  [buying_day, selling_day]
end

puts stock_picker([17,3,6,9,15,8,6,1,10])