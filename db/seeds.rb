# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
u1 = User.create :name => 'Craig', :username => 'TheDaddy', :email => 'craig@gmail.com', :password => 'chicken', :password_confirmation => 'chicken'
u2 = User.create :name => 'Tash', :username => 'TheMommy', :email => 'tash@gmail.com', :password => 'chicken', :password_confirmation => 'chicken'

Post.destroy_all
p1 = Post.create :title => 'HTML babies', :image => 'http://40.media.tumblr.com/tumblr_me9izrcMfd1rt7j2bo1_500.jpg', :content => 'This is some fake content blah blah'
p2 = Post.create :title => 'Eat your veggies', :image => 'http://browncardigan.s3.amazonaws.com/imagesfarm/2015/qmjW09hdEGlMH1C.jpg', :content => 'This is some fake content about eating your veggies'

u1.posts << p1
u2.posts << p2