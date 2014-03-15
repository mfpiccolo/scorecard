class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string      :text
      t.integer     :weight
      t.references  :scorecard, null: false
      t.foreign_key :scorecards

      t.timestamps
    end
  end
end
