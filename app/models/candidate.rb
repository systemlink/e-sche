class Candidate < ActiveRecord::Base
  validates :date, :presence => true
end
