class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :event_id, null: false
      t.string :name, null: false
      t.text :comment

      t.timestamps null: false
    end
  end
end
