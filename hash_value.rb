class HashValue

    def initialize(input)
        @input = input
    end

    def name
        return "book" if @input.include?("book")
        return "music CD" if @input.include?("music CD")
        return "chocolate bar" if @input.include?("chocolate bar")
        return "headache pills" if @input.include?("headache pills")
        return "imported chocolates" if @input.include?("imported ") && @input.include?("chocolates")
        return "imported perfume" if @input.include?("imported") && @input.include?("perfume")
        return "medicines" if @input.include?("medicines")
        return "perfume" if @input.include?("perfume")
    end

    def quantity
        @input[0].to_i
    end

    def price
      @input.match(/(\d+\.\d*)/)&.captures&.first.to_f
    end

    def sales(price)
        if(@input.include?("imported") && @input.include?("chocolates")) 
            val = (price * 0.05).to_f
        elsif(@input.include?("imported")) 
            val = (price * 0.15).to_f
        elsif(@input.include?("book") || @input.include?("chocolate") || @input.include?("pills")) 
            val = 0
        else 
            val = (price * 0.10).to_f
        end
        return val.to_f.round(2)
    end
end
