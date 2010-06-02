class MealCook < ActiveRecord::Base
  belongs_to :meal
  belongs_to :member
end
