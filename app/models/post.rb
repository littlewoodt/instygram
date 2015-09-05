# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :text
#  image      :text
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
	belongs_to :user
end
