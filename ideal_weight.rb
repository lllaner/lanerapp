puts "please enter your name"
user_name = gets.chomp
puts "please enter your height"
user_height = gets.chomp
user_weight = user_height.to_i - 110
if user_weight <= 0
	puts "your weight is optimal"
else
	puts "#{user_name}, your optimal weight is #{user_weight}"
end