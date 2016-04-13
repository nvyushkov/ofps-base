json.array!(@ptpktps) do |ptpktp|
  json.extract! ptpktp, :id
  json.url ptpktp_url(ptpktp, format: :json)
end
