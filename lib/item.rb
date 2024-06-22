# item.rb
class Item
  attr_reader :quantity, :name, :price, :imported, :exempt

  EXEMPT_ITEMS = ["book", "chocolate", "pill"]

  def initialize(quantity, name, price)
    @quantity = quantity.to_i
    @name = name
    @price = price.to_f
    @imported = name.include?("imported")
    @exempt = EXEMPT_ITEMS.any? { |item| name.include?(item) }
  end

  def sales_tax
    base_tax = @exempt ? 0 : 0.10
    import_tax = @imported ? 0.05 : 0
    total_tax_rate = base_tax + import_tax

    tax = @price * total_tax_rate
    rounded_tax = (tax * 20).ceil / 20.0
    rounded_tax
  end

  def total_price
    (@price + sales_tax) * @quantity
  end

  def to_s
    "#{@quantity} #{@name}: #{'%.2f' % total_price}"
  end
end
