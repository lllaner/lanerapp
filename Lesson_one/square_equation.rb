#Enter coeffficients
puts "Please enter your coefficients"
puts "Please enter coefficients number 1"
a = gets.chomp.to_f
puts "Please enter coefficients number 2"
b = gets.chomp.to_f
puts "Please enter coefficients number 3"
c = gets.chomp.to_f
#Finding discriminant
d = b*b - 4 * a * c 

#Output results

if d > 0
  sqrt_d = Math.sqrt(d)
  puts "Discriminant is #{d}.\nFirs root is #{(-b + sqrt_d)/ (2*a)}
  \rSecond root is #{(-b - sqrt_d)/ (2*a)}"
end

puts "Root of the quation is #{-b/2*a}. Discriminant is #{d}." if d == 0
puts "Discriminant is #{d}. There are no roots of the equation" if d < 0
