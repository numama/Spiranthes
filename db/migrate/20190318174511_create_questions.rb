class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :name
      t.text :body
      t.boolean :is_answered
      
      t.timestamps
    end
  end
end
