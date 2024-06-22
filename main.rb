# main.rb
require_relative 'lib/parser'

# Test Inputs
input1 = <<-INPUT
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
INPUT

input2 = <<-INPUT
1 imported box of chocolates at 10.00
1 imported bottle of perfume at 47.50
INPUT

input3 = <<-INPUT
1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
3 imported boxes of chocolates at 11.25
INPUT

# Processing Inputs
receipt1 = parse_input(input1)
receipt2 = parse_input(input2)
receipt3 = parse_input(input3)

# Output Receipts
puts "Output 1:"
receipt1.print_receipt
puts "\nOutput 2:"
receipt2.print_receipt
puts "\nOutput 3:"
receipt3.print_receipt
