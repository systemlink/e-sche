class Answer < ActiveRecord::Base
  has_many :joins
  belongs_to :event
end
