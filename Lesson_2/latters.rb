latters = ("a".."z").to_a
number = (0..25).to_a
all_latters = {}
number.each {|x| all_latters[latters[x]] = x +1 if latters[x][/[aeiou]/]}
p all_latters

