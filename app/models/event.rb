class Event < ActiveRecord::Base
  validates :title, :presence => true
  has_many :candidates
  has_many :answers
  
  def dates
    candidates.map(&:date)
  end
end
