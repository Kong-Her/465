class Doi < ActiveRecord::Base
  has_many :urls, dependent: :destroy

  def identifier
     doi
  end

end
