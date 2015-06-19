class Plan < ActiveRecord::Base
  validates :title, :presence => true
end
