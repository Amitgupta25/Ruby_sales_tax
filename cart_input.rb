require 'pry'
class CartInput
    
    TAXES = {"imported" => 0.05, "basic" => 0.10}
    EXEMPT = ["book", "chocolate", "pills", "chocolates"]
    IMP = "imported" 
    NAME_RX = (/\w[a-z]+\w+\s/)
    PRICE_RX = (/(\d+\.\d*)/)

    attr_reader :cart_hash, :cart_item

    def initialize(cart_item) 
        @cart_item = cart_item
        price = cart_item.match(PRICE_RX)[0].to_f
        name = cart_item.scan(NAME_RX).join
        sales  = sales_tax(price)
        quantity = cart_item[0].to_i
        @cart_hash = { name: name, quantity: quantity, price: price, sales: sales }
    end

    def exempt
        EXEMPT.any? {|a| cart_item.include?(a)}
    end

    def sales_tax(price)
        val = (exempt) ? 0 : (price * TAXES["basic"])
        val += (cart_item.include?IMP) ? (price * TAXES["imported"]) : 0
    end
end
    