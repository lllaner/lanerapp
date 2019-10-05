# frozen_string_literal: true

NAME = ['hello', 'buy']

def hello
  puts 'HELLO'
end

def buy
  puts 'buy'
end

choose = gets.chomp.to_i

send(NAME[choose])
