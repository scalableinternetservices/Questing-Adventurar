require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "profile attributes defined correctly" do
  	ryan = users(:ryan)
  	
  	p = ryan.profile
    assert p.first_name == 'Ryan'
    assert p.last_name == 'Dai'
    assert p.gender == 'Male'
    assert p.questgiver_rating == 3.0
    assert p.adventurer_rating == 3.0

    pn = ryan.phone_numbers
    assert pn[0].phone_number == 3101234567

    a = ryan.addresses
    assert a[0].zip_code == 90024
  end

  test "quest associations defined correctly" do
  	albert = users(:albert)

  	gq = albert.given_quests
  	assert gq[0].title == 'Cereal Killer'
  	assert gq[0].pending_adventurers[0] == users(:ryan)

  	tq = albert.taken_quests
  	assert tq[0].title == 'Milk and Honey'
  end

end
