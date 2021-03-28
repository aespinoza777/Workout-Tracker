class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name 
      t.boolean :completed
      t.string :duration 
      t.references :user 
      t.timestamps
    end
  end
end
