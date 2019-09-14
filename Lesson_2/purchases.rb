#Creating Variables
cart= {}
total_price = 0

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
  cart[name_product] = {product_price => number_product }
#Sum total sale
  total_price += product_price * number_product
end

#Output result
cart.each{|x,y| p "Name: #{x} ,price: #{y.keys[0]} number: #{y.values[0]}"}
p "Total price: #{total_price.round(2)}"
