#Create alphabet
latters = ("a".."z").to_a
number = (0..25).to_a
all_latters = {}

#create hash with vowels
number.each {|x| all_latters[latters[x]] = x +1 if latters[x][/[aeiou]/]}

#Output vowels latters
p all_latters
