class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_items
  validates :name, :price, :description, presence: true
end
