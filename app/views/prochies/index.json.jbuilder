json.array!(@prochies) do |prochy|
  json.extract! prochy, :id
  json.url prochy_url(prochy, format: :json)
end
