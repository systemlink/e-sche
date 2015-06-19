class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.integer :event_id
      t.date :date

      t.timestamps null: false
    end
  end
end
