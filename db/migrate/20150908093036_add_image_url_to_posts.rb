class AddImageUrlToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :image_url, :text
  end
end
