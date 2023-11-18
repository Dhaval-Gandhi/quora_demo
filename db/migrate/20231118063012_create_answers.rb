class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.text :content
      t.references :question
      t.references :user

      t.timestamps
    end
  end
end
