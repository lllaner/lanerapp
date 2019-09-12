#Enter sides in array
puts "Please enter sides of triangle"
sides = []
for i in 0..2 do 
  puts "Please enter sides number #{i + 1}"
  sides << gets.chomp.to_f
end

#Sort of array
sides.sort!

print "Triangle is"

#Check if the triangle is equilateral
print " equilateral" if sides[0] == sides[1] && sides[0] == sides[2]

#Check if the triangle is isosceles
print " isosceles" if sides[0] == sides[1] || sides[0] == sides[2] || sides[1] == sides[2]

#Check if the triangle is rectangular
print " rectangular" if ( sides[2] * sides[2] == sides[0] * sides[0] + sides[1] * sides[1])
