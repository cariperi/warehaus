require 'rails_helper'

RSpec.describe Item, type: :model do

  context "without tags" do

    before(:each) do
      @item = Item.create!({name: "Test Item", quantity: 123, upc: Faker::Barcode.upc_a, description: "A test description.", price: 1234, weight: 987})
    end

    it "checks that an item can be created" do
      valid_params = {name: "New Item", quantity: 123, upc: Faker::Barcode.upc_a, description: "A test description.", price: 1234, weight: 987}
      new_item = Item.new(valid_params)
      expect(new_item).to be_valid
    end

    it "checks that an item can be edited" do
      @item.update!({quantity: 456})
      expect(@item.quantity).to eq(456)
    end

    it "checks that an item can be deleted" do
     previous_count = Item.count
      @item.destroy!
      expect(Item.count).to eq(previous_count - 1)
    end

    it "checks that items can be filtered by name" do
      expect(Item.search_by_name(@item.name)).to include(@item)
    end

    it "checks that items can be filtered by price" do
      price = @item.price
      min = (price - 1)
      max = (price + 1)
      expect(Item.in_price_range(min, max)).to include(@item)
    end

    it "returns true if in stock" do
      expect(Item.new({quantity: 1}).in_stock?).to be_truthy
    end

    it "returns false if out of stock" do
      expect(Item.new({quantity: 0}).in_stock?).to be_falsey
    end
  end

  context "with tags" do

    before(:each) do
      @tag_1 = Tag.create!({text: "Tag1"})
      @tag_2 = Tag.create!({text: "Tag2"})
      @tag_3 = Tag.create!({text: "Tag3"})
      @item_1 = Item.create!({name: "Item1", quantity: 123, upc: Faker::Barcode.upc_a, description: "A test description.", price: 1234, weight: 987, tags: [@tag_1, @tag_2]})
      @item_2 = Item.create!({name: "Item2", quantity: 123, upc: Faker::Barcode.upc_a, description: "A test description.", price: 1234, weight: 987, tags: [@tag_2, @tag_3]})
    end

    it "checks that an item can be found by its tag(s)" do
      found_items = Item.with_tags(@tag_1)
      expect(found_items).to include(@item_1)
      expect(found_items).to_not include(@item_2)
    end
  end
end
