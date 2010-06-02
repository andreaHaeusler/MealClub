class Meal < ActiveRecord::Base
  validates_numericality_of :cost, :on => :create
  has_many :meal_cooks
  has_many :meal_guests
  has_many :cooks, :through => :meal_cooks, :source => :member
  has_many :guests, :through => :meal_guests, :source => :member
end
