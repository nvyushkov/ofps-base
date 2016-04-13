json.array!(@edds_prochies) do |edds_prochy|
  json.extract! edds_prochy, :id
  json.url edds_prochy_url(edds_prochy, format: :json)
end
