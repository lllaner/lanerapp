#Creating Variables
total_price = 0
cart ={}
#Input command
loop do
  p "Please enter name of product"
  name_product = gets.chomp
  break if name_product == "stop"
#Creating hash with product
  p "Please enter price of product"
  product_price = gets.chomp.to_f
  p "Please enter number of product"
  number_product = gets.chomp.to_f
  cart[name_product] = { price: product_price, count: number_product }
end

#Output result
cart.each do |name,values| 
  total_price_product = values[:price] * values[:count]
  p "#{name} - price: #{values[:price]}, count: #{values[:count]}, total: #{total_price_product}"
  total_price+=total_price_product
end
p "total price: #{total_price.round(2)}"
