class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :title
      t.text :note

      t.timestamps null: false
    end
  end
end
