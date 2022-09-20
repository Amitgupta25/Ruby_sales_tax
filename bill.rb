require_relative('sale.rb')
require_relative('total.rb')
require_relative('final_value.rb')
require_relative('hash_value.rb')
require 'pry'


class Bill
    @@container = []    
  
		def input
    p 'Please enter the items'
    while (input = gets.chomp) != 'exit'
      p 'Please enter the items'
			hash_value = HashValue.new(input)
			name = hash_value.name
			quantity = hash_value.quantity
			price = hash_value.price
			sales = hash_value.sales(price)
      @@container << { name: name,
          quantity: quantity, price: price, sales: sales }
    end
		Final.new(@@container).final_value
    Sales.new(@@container).sales_tax
		Total.new(@@container).total
  end
end

Bill.new.input



