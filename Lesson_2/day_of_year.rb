#Enter data
arr = ["day","month","year"]
data = []
3.times do |x| 
  p "Please input #{arr[x]}" 
  data << gets.chomp.to_i
end

month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
month[data[1]-1] = data[0]
#Chek if year is leap
month[1] = 29 if data[2] % 400 == 0 || (data[2] % 4 == 0 && data[2] % 100 != 0)

#Getting day of year
day_of_year = month.take(data[1]).sum

#Output day of year
p "Number of day is #{day_of_year}"
