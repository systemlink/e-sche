class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :title
      t.text :note
      t.date :start_period
      t.date :end_period

      t.timestamps null: false
    end
  end
end
