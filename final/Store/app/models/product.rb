class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_items
  validates :name, :price, :description, presence: true
  def self.search(search)
    if search
      where 'name LIKE ?', "%#{search}%"
    else 
      @products = Product.all 
    end
  end
end
