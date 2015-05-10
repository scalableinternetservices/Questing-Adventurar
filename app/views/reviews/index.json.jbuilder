json.array!(@reviews) do |review|
  json.extract! review, :id, :rating, :quest_id, :questgiver_id, :adventurer_id, :comment, :post_time
  json.url review_url(review, format: :json)
end
