# parser.rb
require_relative 'receipt'
require_relative 'item'

class InvalidLineFormatError < StandardError; end

  def parse_input(input)
   receipt = Receipt.new

   input.each_line do |line|
     line.strip!
     next if line.empty?

     match_data = line.match(/^(\d+)\s+(.+)\s+at\s+([\d\.]+)$/)

     if match_data
       quantity = match_data[1].to_i
       name = match_data[2]
       price = match_data[3].to_f
       receipt.add_item(Item.new(quantity, name, price))
     else
       raise InvalidLineFormatError, "Invalid line format: #{line}"
     end
   end

   receipt
  end
