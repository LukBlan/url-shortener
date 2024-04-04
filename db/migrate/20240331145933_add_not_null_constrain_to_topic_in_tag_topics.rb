class AddNotNullConstrainToTopicInTagTopics < ActiveRecord::Migration[7.1]
  def change
    change_column_null :tag_topics, :topic, false
  end
end
