exempt = []
import = []
normal = []
p "Please enter the items"
while (input = gets.chomp) != 'exit'
    p "Please enter the items"
    if input.include?("book") || input.include?("pills") || input.include?("medicine") ||   input.include?("food") || input.include?("chocolate")
        exempt << input
    elsif input.include?("imported")
        import << input
    else
        normal << input
    end

end

# p exempt
# p import
# p normal
sales_tax = 0
# exempt.each {|i| sales_tax += (i.scan(/(\d+[.,]\d+)/).first.first).to_f }
normal.each {|i| sales_tax += ((i.scan(/(\d+[.,]\d+)/).first.first).to_f)* 10/100 }
import.each {|i| sales_tax += ((i.scan(/(\d+[.,]\d+)/).first.first).to_f)* 15/100 }

p sales_tax
