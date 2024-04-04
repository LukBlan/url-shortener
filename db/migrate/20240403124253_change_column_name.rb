class ChangeColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :taggings, :user_id, :short_url_id
  end
end
