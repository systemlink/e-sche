class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.integer :answer_id, null: false
      t.integer :candidate_id, null: false

      t.timestamps null: false
    end
  end
end
