class AddColumnToComments < ActiveRecord::Migration
  def change
    add_column :comments, :tutorial_id, :integer
  end
end
