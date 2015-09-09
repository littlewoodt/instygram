# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :text
#  username        :text
#  email           :text
#  password_digest :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
	has_secure_password
	has_many :posts, dependent: :destroy
  	has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
 	has_many :following, through: :active_relationships, source: :followed

	validates :email, :presence => true, :uniqueness => true
	validates :name, :presence => true, :uniqueness => true, :length => { :minimum => 3 }
end