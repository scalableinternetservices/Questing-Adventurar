# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  user = User.new(
      :email                 => "admin@xxxxx.xxx",
      :password              => "12345678",
      :password_confirmation => "12345678"
  )
  # user.skip_confirmation!
  user.save!
Quest.create(
	questgiver: user,
	  adventurer: user,
	  title: 'Milk and Honey',
	  price: 10.00,
	  description: 'Please get me milk!',
	  post_time: 20150412110000,
	  expiration_time: 20150413210000
	)