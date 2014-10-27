class Url < ActiveRecord::Base

  validates :url, presence: true
  validates :doi, presence: true

  belongs_to :doi
end
