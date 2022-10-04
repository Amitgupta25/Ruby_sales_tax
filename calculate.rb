class Calculate
    attr_reader :cart_item 

    def initialize(cart_item)
        @cart_item = cart_item
        item_cost; sales_tax; total_cost
    end
    
    def item_cost
        cart_item.map{|i| puts "#{i[:quantity]} #{i[:name]}:" + " #{(i[:price] + i[:sales]).round(2)}"}  
	end

    def sales_tax    
        val = cart_item.map {|i| i[:sales]}.sum
        puts "Sales Taxes: #{val.round(2)}"
    end

    def total_cost
        val = cart_item.map {|i| i[:price] + i[:sales]}.sum
        puts "Total: #{val.round(2)}"
    end
end


