#Filling start elements
arr = Array.new(2) { |i| i  }

#Filling array before 100 
while ((fibonacci  =  arr[-1] + arr[-2]) < 100)
  arr <<  fibonacci
end
