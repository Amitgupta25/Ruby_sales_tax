class Total
    def initialize(container)
        @container = container
    end

    def total
        val = 0
        @container.each do |i|
            i.each do |k,v|
                if k == :price
                    val += v
                end
                if k == :sales
                    val += v
                end
            end
        end
        puts "Total: #{val.round(2)}"
    end
end