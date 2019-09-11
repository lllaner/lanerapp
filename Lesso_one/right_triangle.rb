puts "Please enter sides of triangle"
a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i
print "triangle is"
print " equilateral" if a == b && a == c
print " isosceles" if a == b || a == c || b == c
print " rectangular" if ((a * a + b * b == c * c) || (a * a + c * c == b * b) || (c * c + b * b == a * a))