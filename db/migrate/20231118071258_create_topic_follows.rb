class CreateTopicFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :topic_follows do |t|
      t.references :user
      t.references :topic

      t.timestamps
    end
  end
end
