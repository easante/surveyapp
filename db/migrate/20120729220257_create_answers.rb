class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :questionnaire_id
      t.integer :user_id
      t.integer :choice

      t.timestamps
    end
  end
end
