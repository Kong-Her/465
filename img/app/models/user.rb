class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :images
  has_many :image_users
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
