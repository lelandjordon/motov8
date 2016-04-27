class UpdateComments < ActiveRecord::Migration
  def change
    remove_column :comments, :author
    add_column :comments, :author_id, :integer
  end
end
