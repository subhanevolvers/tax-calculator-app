require_relative '../../lib/item'

RSpec.describe Item do
  describe '#initialize' do
    it 'sets the attributes correctly' do
      item = Item.new(1, 'book', 12.49)
      expect(item.quantity).to eq(1)
      expect(item.name).to eq('book')
      expect(item.price).to eq(12.49)
      expect(item.imported).to be false
      expect(item.exempt).to be true
    end
  end

  describe '#sales_tax' do
    it 'calculates sales tax correctly for non-exempt non-imported items' do
      item = Item.new(1, 'music CD', 14.99)
      expect(item.sales_tax).to eq(1.50)
    end

    it 'calculates sales tax correctly for exempt non-imported items' do
      item = Item.new(1, 'book', 12.49)
      expect(item.sales_tax).to eq(0.0)
    end

    it 'calculates sales tax correctly for non-exempt imported items' do
      item = Item.new(1, 'imported bottle of perfume', 47.50)
      expect(item.sales_tax).to eq(7.15)
    end

    it 'calculates sales tax correctly for exempt imported items' do
      item = Item.new(1, 'imported box of chocolates', 10.00)
      expect(item.sales_tax).to eq(0.50)
    end
  end

  describe '#total_price' do
    it 'calculates total price correctly' do
      item = Item.new(2, 'book', 12.49)
      expect(item.total_price).to eq(24.98)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the item' do
      item = Item.new(1, 'book', 12.49)
      expect(item.to_s).to eq('1 book: 12.49')
    end
  end
end
