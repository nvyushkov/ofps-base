json.array!(@vozgoranies) do |vozgorany|
  json.extract! vozgorany, :id
  json.url vozgorany_url(vozgorany, format: :json)
end
