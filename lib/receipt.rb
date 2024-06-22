# receipt.rb
require_relative 'item'

class Receipt
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def total_sales_taxes
    @items.sum { |item| item.sales_tax * item.quantity }
  end

  def total_amount
    @items.sum { |item| item.total_price }
  end

  def print_receipt
    @items.each { |item| puts item }
    puts "Sales Taxes: #{'%.2f' % total_sales_taxes}"
    puts "Total: #{'%.2f' % total_amount}"
  end
end
