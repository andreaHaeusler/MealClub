class Member < ActiveRecord::Base
  has_many :meal_cooks
  has_many :meal_guests
  has_many :meals_cooked, :through => :meal_cooks, :source => :meal
  has_many :meals_as_guest, :through => :meal_guests, :source => :meal
end
