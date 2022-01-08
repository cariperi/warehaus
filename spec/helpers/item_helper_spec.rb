require 'rails_helper'

RSpec.describe ItemHelper do
  let(:price_cents) { Item.new({price: 50}) }
  let(:price_dollars) { Item.new({price: 1000}) }
  let(:weight_grams) { Item.new({weight: 900}) }
  let(:weight_kilograms) { Item.new({weight: 2000}) }

  it "formats price less than a dollar" do
    expect(format_price(price_cents)).to eq("$0.50")
  end

  it "formats price greater than a dollar" do
    expect(format_price(price_dollars)).to eq("$10.00")
  end

  it "formats weights less than a kilogram" do
    expect(format_weight(weight_grams)).to eq("900 g")
  end

  it "formats weights greater than a kilogram" do
    expect(format_weight(weight_kilograms)).to eq("2 kg")
  end
end
