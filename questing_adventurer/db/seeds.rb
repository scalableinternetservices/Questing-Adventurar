# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Pending.delete_all
Quest.delete_all
User.delete_all

  user = User.new(
      :email                 => "rydy@qa.com",
      :password              => "12345678",
      :password_confirmation => "12345678"
  )
  # user.skip_confirmation!
  user.save!

  user2 = User.new(
      :email                 => "albur@qa.com",
      :password              => "12345678",
      :password_confirmation => "12345678"
  )
  # user.skip_confirmation!
  user2.save!

    user3 = User.new(
      :email                 => "vikwan@qa.com",
      :password              => "12345678",
      :password_confirmation => "12345678"
  )
  # user.skip_confirmation!
  user3.save!

    user4 = User.new(
      :email                 => "choanna@qa.com",
      :password              => "12345678",
      :password_confirmation => "12345678"
  )
  # user.skip_confirmation!
  user4.save!

q1 = Quest.create(
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
	  expiration_time: 20150413210000,
	)

pending2 = Pending.create(
	user_id: user2.id,
	quest_id: q1.id
	)

pending3 = Pending.create(
	user_id: user3.id,
	quest_id: q1.id
	)

pending4 = Pending.create(
	user_id: user4.id,
	quest_id: q1.id
	)