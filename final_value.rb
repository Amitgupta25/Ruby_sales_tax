class Final

    def initialize(container)
        @container = container
    end

    def final_value
        @container.each do |i|
            puts "#{i[:quantity]} #{i[:name]}:" + " #{(i[:price] + i[:sales])}"
        end
	end
end