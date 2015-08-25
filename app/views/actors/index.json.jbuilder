json.array!(@actors) do |actor|
  json.extract! actor, :id, :name, :file, :id
  json.url actor_url(actor, format: :json)
end
