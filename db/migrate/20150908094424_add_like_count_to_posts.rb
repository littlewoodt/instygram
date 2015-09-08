class AddLikeCountToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :like_count, :integer
  end
end