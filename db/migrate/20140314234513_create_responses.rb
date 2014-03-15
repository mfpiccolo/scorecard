class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references  :scorecard, null: false
      t.foreign_key :scorecards
      t.references  :question_response, null: false
      t.foreign_key :question_responses

      t.timestamps
    end
  end
end
