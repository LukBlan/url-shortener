class CreateTagTopics < ActiveRecord::Migration[7.1]
  def change
    create_table :tag_topics do |t|
      t.string :topic
      t.timestamps
    end
  end
end
