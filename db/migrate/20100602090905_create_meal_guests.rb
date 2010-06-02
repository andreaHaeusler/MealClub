class CreateMealGuests < ActiveRecord::Migration
  def self.up
    create_table :meal_guests do |t|
      t.integer :meal_id
      t.integer :member_id

      t.timestamps
    end
  end

  def self.down
    drop_table :meal_guests
  end
end
