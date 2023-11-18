class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :content
      t.references :topic
      t.references :user

      t.timestamps
    end
  end
end
