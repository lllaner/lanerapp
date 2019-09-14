#Filling start elements
arr = Array.new(2) { |i| i  }

#Filling array before 100 
loop do
  fibonacci  =  arr[-1] + arr[-2]
  break if fibonacci > 100 
  arr <<  fibonacci
end
