class Image < ActiveRecord::Base
  belongs_to :user
  #has_many :users, through :image_users
  has_many :tags
  has_many :image_users

  def generate_filename
    self.filename = rand(10**20).to_s(32) + ".jpg"
  end
end
