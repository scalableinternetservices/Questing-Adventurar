json.array!(@quests) do |quest|
  json.extract! quest, :id, :questgiver_id, :adventurer_id, :title, :price, :description, :post_time, :expiration_time
  json.url quest_url(quest, format: :json)
end
