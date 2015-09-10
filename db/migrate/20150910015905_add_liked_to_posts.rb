class AddLikedToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :like, :text
  end
end