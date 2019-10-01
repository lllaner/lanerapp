r = gets.chomp
regex = /^[a-zа-я0-9]{3}[-]*[a-zа-я0-9]{2}/
if r =~ regex
  puts "right"
else
  puts "not right"
end
