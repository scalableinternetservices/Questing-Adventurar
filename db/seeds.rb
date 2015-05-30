# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)

# Profile
# User
# lat/long
# 10 quests on each?!

address_samples = [
  ["400 Gayley Avenue, Los Angeles, CA 90024, USA", 34.070768, -118.452399],
  ["505 Gayley Avenue, Los Angeles, CA 90024, USA", 34.069673, -118.451163],
  ["592 Gayley Avenue, Los Angeles, CA 90024, USA", 34.068791, -118.448971],
  ["834-844 Levering Ave, Los Angeles, CA 90024, USA", 34.062969, -118.448413],
  ["10860-10868 Weyburn Ave, Los Angeles, CA 90024, USA", 34.062338, -118.443478]
]

1000.times { |x|
  demo = User.new(
    username: "demo#{x}",
    email: "demo#{x}@qa.com",
    password: "12345678",
    password_confirmation: "12345678"
  )

  demo_profile = Profile.new(
    user: demo,
    first_name: "Ryan",
    last_name: "Dai",
    gender: "Male",
    address: address_samples[x % address_samples.size()][0],
    latitude: address_samples[x % address_samples.size()][1],
    longitude: address_samples[x % address_samples.size()][2],
    questgiver_rating: 3.0,
    adventurer_rating: 4.0
  )

  demo.save!
  demo_profile.save!

  10.times do
    quest = Quest.new(
      questgiver: demo,
      title: "Load testing quest.",
      price: 10.00,
      description: "Sample quest!",
      latitude: address_samples[x % address_samples.size()][1],
      longitude: address_samples[x % address_samples.size()][2],
      post_time: 5.day.ago.to_s(:db),
      expiration_time: 5.day.from_now.to_s(:db),
      status: 0
    )
    quest.save!
  end
}


# user2 = User.new(
# :username              => "albur",
# :email                 => "albur@qa.com",
# :password              => "12345678",
# :password_confirmation => "12345678"
# )
# # user.skip_confirmation!
# user2.save!
#
# user3 = User.new(
# :username              => "vikwan",
# :email                 => "vikwan@qa.com",
# :password              => "12345678",
# :password_confirmation => "12345678"
# )
# # user.skip_confirmation!
# user3.save!
#
# user4 = User.new(
# :username              => "choanna",
# :email                 => "choanna@qa.com",
# :password              => "12345678",
# :password_confirmation => "12345678"
# )
# # user.skip_confirmation!
# user4.save!
#
# q1 = Quest.create(
# questgiver: user,
# adventurer: user,
# title: 'Q1',
# price: 10.00,
# description: 'Give me a Quest!',
# post_time: DateTime.now,
# expiration_time: DateTime.now
# )
# q2 = Quest.create(
# questgiver: user,
# adventurer: user,
# title: 'Q2',
# price: 10.00,
# description: 'Quest accepted!',
# post_time: DateTime.now,
# expiration_time: DateTime.now
# )
# q3 = Quest.create(
# questgiver: user,
# adventurer: user,
# title: 'Q3',
# price: 10.00,
# description: 'Quest...failed...',
# post_time: DateTime.now,
# expiration_time: DateTime.now
# )
#
# pending2 = Pending.create(
# user_id: user2.id,
# quest_id: q1.id
# )
#
# pending3 = Pending.create(
# user_id: user3.id,
# quest_id: q1.id
# )
#
# pending4 = Pending.create(
# user_id: user4.id,
# quest_id: q1.id
# )
