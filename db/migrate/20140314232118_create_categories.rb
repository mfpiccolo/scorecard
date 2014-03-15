class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references  :scorecard, null: false
      t.foreign_key :scorecards
      t.string      :name
      t.timestamps
    end

    add_index :categories, :id
    add_index :categories, :scorecard_id
  end
end
