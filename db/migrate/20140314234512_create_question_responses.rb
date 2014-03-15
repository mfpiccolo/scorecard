class CreateQuestionResponses < ActiveRecord::Migration
  def change
    create_table :question_responses do |t|
      t.text        :text
      t.integer     :rating
      t.references  :question, null: false
      t.foreign_key :questions
      t.integer     :response_id

      t.timestamps
    end
  end
end
