class Item < ApplicationRecord
  has_many :items_tags
  has_many :tags, through: :items_tags

  validates :name, :upc, presence: true, uniqueness: true
  validate :upc_correct_length
  validates :description, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, :weight, numericality: { only_integer: true, greater_than: 0 }

  def in_stock?
    quantity > 0
  end

  private
  def upc_correct_length
    if upc.present? && upc.length != 12
      errors.add(:upc, "UPC length must be 12 digits.")
    end
  end
end
