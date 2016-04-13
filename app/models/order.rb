class Order < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy
	validates :name, :address, :phonenumber, :presence => true  
	belongs_to :user
  validates :user_id, presence: true
  def total_price
    @total_price ||= line_items.includes(:product).reduce(0) do |sum, line_item|
      sum + (line_item.quantity * line_item.product.price)
    end
  end
	
	def add_line_items_from_cart(cart)  
  cart.line_items.each do |item|  
    item.cart_id = nil  
    line_items << item  
  end  
end  
end
