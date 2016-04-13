json.array!(@fpsignals) do |fpsignal|
  json.extract! fpsignal, :id
  json.url fpsignal_url(fpsignal, format: :json)
end
