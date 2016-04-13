json.array!(@fires) do |fire|
  json.extract! fire, :id
  json.url fire_url(fire, format: :json)
end
