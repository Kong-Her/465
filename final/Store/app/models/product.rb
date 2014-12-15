class Product < ActiveRecord::Base
  validates :name, :price, :description, presence: true
end
