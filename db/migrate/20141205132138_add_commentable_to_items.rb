class AddCommentableToItems < ActiveRecord::Migration
  def change
    add_column :items, :commentable, :boolean
  end
end
