# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Quest.delete_all
User.delete_all
  user = User.new(
      :email                 => "rydy@qa.com",
      :password              => "12345678",
      :password_confirmation => "12345678"
  )
  # user.skip_confirmation!
  user.save!
Quest.create(
	questgiver: user,
	  adventurer: user,
	  title: 'Q1',
	  price: 10.00,
	  description: 'Give me a Quest!',
	  post_time: 20150412110000,
	  expiration_time: 20150413210000
	)
Quest.create(
	questgiver: user,
	  adventurer: user,
	  title: 'Q2',
	  price: 10.00,
	  description: 'Quest accepted!',
	  post_time: 20150412110000,
	  expiration_time: 20150413210000
	)
Quest.create(
	questgiver: user,
	  adventurer: user,
	  title: 'Q3',
	  price: 10.00,
	  description: 'Quest...failed...',
	  post_time: 20150412110000,
	  expiration_time: 20150413210000
	)