require_relative('calculate.rb')
require_relative('cart_input.rb')
require 'pry'

class Cart
  VALID_REG = (/\d\s([a-zA-Z]\w*\s)+(\d+\.\d*)/)

	def input
    cart_input = []
    p 'Please enter the items'
    while (input = gets.chomp) != 'exit'
      valid_input = input.match?VALID_REG
      puts 'Please Enter valid input' unless valid_input
      p 'Please enter the items' 
      cart_input << CartInput.new(input).cart_hash if valid_input
    end
		calc = Calculate.new(cart_input)  
  end 
end

Cart.new.input



