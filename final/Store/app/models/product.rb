class Product < ActiveRecord::Base
  belongs_to :category
  validates :name, :price, :description, presence: true
end
