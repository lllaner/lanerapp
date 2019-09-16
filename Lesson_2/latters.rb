#Create alphabet
latters = ("a".."z").to_a
all_latters = {}
# = x +1 if latters[x][]
vowel = /[aeiou]/
#create hash with vowels
latters.each.with_index {|latter,value| all_latters[latter] = value + 1 if latter[vowel]}

#Output vowels latters
p all_latters
