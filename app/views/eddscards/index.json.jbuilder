json.array!(@eddscards) do |eddscard|
  json.extract! eddscard, :id
  json.url eddscard_url(eddscard, format: :json)
end
