json.array!(@profiles) do |profile|
  json.extract! profile, :id, :user_id, :username, :first_name, :last_name, :gender, :questgiver_rating, :adventurer_rating
  json.url profile_url(profile, format: :json)
end
