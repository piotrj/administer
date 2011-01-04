class AddPublishOnToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :publish_on, :date
  end

  def self.down
    remove_column :posts, :publish_on
  end
end
