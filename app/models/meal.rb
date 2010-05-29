class Meal < ActiveRecord::Base
  validates_numericality_of :cost, :on => :create 
end
