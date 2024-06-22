require_relative '../../lib/parser'
require_relative '../../lib/receipt'
require_relative '../../lib/item'

RSpec.describe '#parse_input' do
  it 'parses input correctly' do
    input = <<-INPUT
    2 book at 12.49
    1 music CD at 14.99
    1 chocolate bar at 0.85
    INPUT

    receipt = parse_input(input)
    expect(receipt.items.size).to eq(3)
    expect(receipt.items[0].name).to eq('book')
    expect(receipt.items[1].name).to eq('music CD')
    expect(receipt.items[2].name).to eq('chocolate bar')
  end

  it 'raises an error with incorrect input format' do
    input = <<-INPUT
      2 book at 12.49
      invalid line
    INPUT

    expect { parse_input(input) }.to raise_error(InvalidLineFormatError)
  end
end
