require_relative '../../lib/receipt'
require_relative '../../lib/item'

RSpec.describe Receipt do
  describe '#add_item' do
    it 'adds an item to the receipt' do
      receipt = Receipt.new
      item = Item.new(1, 'book', 12.49)
      receipt.add_item(item)
      expect(receipt.items).to include(item)
    end
  end

  describe '#total_sales_taxes' do
    it 'calculates total sales taxes correctly' do
      receipt = Receipt.new
      receipt.add_item(Item.new(1, 'music CD', 14.99))
      receipt.add_item(Item.new(1, 'imported bottle of perfume', 47.50))
      expect(receipt.total_sales_taxes).to eq(8.65)
    end
  end

  describe '#total_amount' do
    it 'calculates total amount correctly' do
      receipt = Receipt.new
      receipt.add_item(Item.new(2, 'book', 12.49))
      receipt.add_item(Item.new(1, 'music CD', 14.99))
      receipt.add_item(Item.new(1, 'chocolate bar', 0.85))
      expect(receipt.total_amount).to eq(42.32)
    end
  end

  describe '#print_receipt' do
    it 'prints the receipt' do
      receipt = Receipt.new
      receipt.add_item(Item.new(1, 'book', 12.49))
      expect { receipt.print_receipt }.to output("1 book: 12.49\nSales Taxes: 0.00\nTotal: 12.49\n").to_stdout
    end
  end
end
