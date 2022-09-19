class Sales

    @@sales_tax = 0
    @@total = 0
    @@exempt = []
    @@import = []
    @@normal = []
    @@onlyImport = []
    def input
        p "Please enter the items"
        while (input = gets.chomp) != 'exit'
            p "Please enter the items"
            if input.include?("imported") && input.include?("chocolates")
                @@onlyImport << input
            elsif input.include?("imported")
                @@import << input
            elsif input.include?("book") || input.include?("pills") || input.include?(  "medicine") ||    input.include?("food") || input.include?("chocolate")
                @@exempt << input
            else
                @@normal << input
            end
        end
    end

    #For displayig the acutual final value of each product 
    def finalValue 
        @@exempt.each {|i| puts "#{i.slice(0...-8)}: #{((i.scan(/(\d+[.,]\d+)/).first.first).to_f).round(2)}"}
        @@normal.each {|i| puts "#{i.slice(0...-8)}: #{((i.scan(/(\d+[.,]\d+)/).first.first).to_f + (i.scan(/(\d+[.,]\d+)/).first.first).to_f*(0.10)).round(2)}"}
        @@import.each {|i| puts "#{i.slice(0...-8)}: #{((i.scan(/(\d+[.,]\d+)/).first.first).to_f + (i.scan(/(\d+[.,]\d+)/).first.first).to_f*(0.15)).round(2)}"}
        @@onlyImport.each {|i| puts "#{i.slice(0...-8)}: #{((i.scan(/(\d+[.,]\d+)/).first.first).to_f + (i.scan(/(\d+[.,]\d+)/).first.first).to_f*(0.05)).round(2)}"}
    end

    # for sales_tax
    def salesTax 
        @@normal.each {|i| @@sales_tax += ((i.scan(/(\d+[.,]\d+)/).first.first).to_f)* 0.1 }
        @@import.each {|i| @@sales_tax += ((i.scan(/(\d+[.,]\d+)/).first.first).to_f)* 0.15 }
        @@onlyImport.each {|i| @@sales_tax += ((i.scan(/(\d+[.,]\d+)/).first.first).to_f)* 0.05 }
        puts "Sales Taxes: #{(@@sales_tax).round(2)}" 
    end

    # For total value
    def totalValue 
        @@exempt.each {|i| @@total += (i.scan(/(\d+[.,]\d+)/).first.first).to_f }
        @@normal.each {|i| @@total += ((i.scan(/(\d+[.,]\d+)/).first.first).to_f)}
        @@import.each {|i| @@total += ((i.scan(/(\d+[.,]\d+)/).first.first).to_f)}
        @@onlyImport.each {|i| @@total += ((i.scan(/(\d+[.,]\d+)/).first.first).to_f)}
        puts "Total: #{(@@total + @@sales_tax).round(2)}"
    end
end       

val = Sales.new
val.input
val.totalValue
val.salesTax
val.finalValue
