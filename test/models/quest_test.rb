require 'test_helper'

class QuestTest < ActiveSupport::TestCase
  test "quest attributes defined correctly" do
  	q = quests(:milk)
  	ryan = users(:ryan)
    albert = users(:albert)
  	
    assert q.questgiver_id == ryan.id
    assert q.adventurer_id == albert.id
    assert q.title == 'Milk and Honey'
    assert q.price == 10.00
    assert q.description == 'Please get me milk!'
    assert q.post_time == '2015-04-12 11:00:00'
    assert q.expiration_time == '2015-04-13 21:00:00'

  end

  # something to test pendings?

end