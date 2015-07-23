class Candidate < ActiveRecord::Base
  validates :date, :presence => true
  belongs_to :event 
  has_many :joins
end
