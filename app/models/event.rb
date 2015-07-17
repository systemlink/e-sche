class Event < ActiveRecord::Base
  validates :title, :presence => true
  has_many :candidates
end
