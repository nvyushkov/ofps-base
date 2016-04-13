json.array!(@rtps) do |rtp|
  json.extract! rtp, :id
  json.url rtp_url(rtp, format: :json)
end
