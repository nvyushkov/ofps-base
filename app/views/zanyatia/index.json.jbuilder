json.array!(@zanyatia) do |zanyatium|
  json.extract! zanyatium, :id
  json.url zanyatium_url(zanyatium, format: :json)
end
