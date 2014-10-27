class Doi < ActiveRecord::Base
  has_many :urls, dependent: :destroy
  accepts_nested_attributes_for :urls

  validates :name, presence: true
  validates :description, presence: true
  validates :url, presence: true
def self.search(search)
          if search.present?
               where(doi: ["#{search}"])
          else
               all
          end
     end
end
