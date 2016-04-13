json.array!(@ipvs) do |ipv|
  json.extract! ipv, :id
  json.url ipv_url(ipv, format: :json)
end
