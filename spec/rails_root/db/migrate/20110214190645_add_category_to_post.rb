class AddCategoryToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :category_id, :integer
  end

  def self.down
    remove_column :posts, :category_id, :integer
  end
end
