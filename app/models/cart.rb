class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def add_item(item_id)
    # Cart#add_item creates a new unsaved line_item for new item
    # Cart#add_item creates an appropriate line_item
    # Cart#add_item updates existing line_item instead of making new when adding same item
    line_item = LineItem.find_by(cart_id: self.id, item_id: item_id)
    if line_item
      line_item.quantity += 1
      return line_item
    else
      LineItem.new(cart_id: self.id, item_id: item_id)
    end
  end

  def total
    self.items.sum(:price)
  end
end
