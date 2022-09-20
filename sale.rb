class Sales

    def initialize(container)
        @container = container
    end

    def sales_tax    
        val = 0
        @container.each do |i|
            i.each do |k, v| 
                if k == :sales 
                    val += v
                end
            end
        end
        puts "Sales Taxes: #{val.round(2)}"
    end
end


