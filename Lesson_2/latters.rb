#Create alphabet
latters = ("a".."z").to_a
all_latters = {}
vowel = /[aeiou]/

#create hash with vowels
latters.each.with_index(1) {|latter,value| all_latters[latter] = value if latter[vowel]}

#Output vowels latters
p all_latters
