class RemoveCommentableTypeFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :commentable_type, :string
    remove_column :comments, :commentable_id, :integer
  end
end
