class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def self.available_items
    # Item.available_items only returns items with inventory
    self.where("inventory > 0")
  end



end
