puts "Please enter your name"
user_name = gets.chomp
puts "Please enter your height"
user_height = gets.chomp.to_f
user_weight = user_height - 110
if user_weight <= 0
  puts "Your weight is optimal"
else
  puts "#{user_name}, your optimal weight is #{user_weight}"
end
