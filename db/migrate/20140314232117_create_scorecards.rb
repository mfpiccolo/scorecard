class CreateScorecards < ActiveRecord::Migration
  def change
    create_table :scorecards do |t|
      t.string :name
      t.text   :description
      t.references  :organization, null: false
      t.foreign_key :organizations

      t.timestamps
    end
  end
end
