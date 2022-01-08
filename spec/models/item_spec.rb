require 'rails_helper'

RSpec.describe Item, type: :model do
  it "returns true if in stock" do
    expect(Item.new({quantity: 1}).in_stock?).to be_truthy
  end

  it "returns false if out of stock" do
    expect(Item.new({quantity: 0}).in_stock?).to be_falsey
  end
end
