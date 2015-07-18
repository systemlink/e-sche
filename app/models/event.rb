class Event < ActiveRecord::Base
  validates :title, :presence => true
  has_many :candidates
  
  def dates
    candidates.map(&:date)
  end
end
