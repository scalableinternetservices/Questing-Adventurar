json.array!(@pendings) do |pending|
  json.extract! pending, :id, :quest_id_id, :user_id_id
  json.url pending_url(pending, format: :json)
end
