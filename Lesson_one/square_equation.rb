#Enter coeffficients
puts "Please enter your coefficients"
puts "Please enter coefficients number 1"
a = gets.chomp.to_i
puts "Please enter coefficients number 2"
b = gets.chomp.to_i
puts "Please enter coefficients number 3"
c = gets.chomp.to_i
#Finding discriminant
d = b*b - 4 * a * c 
#Output results
puts "Discriminant is #{d}. \n Firs root is #{(-b + Math.sqrt(d)) / (2*a)} \n Second root is #{(-b - Math.sqrt(d)) / (2*a)}" if d > 0
puts "Root of the quation is #{-b/2*a}. Discriminant is #{d}." if d == 0
puts "Discriminant is #{d}. There are no roots of the equation" if d < 0


