json.array!(@dtps) do |dtp|
  json.extract! dtp, :id
  json.extract! dtp, :date
  json.extract! dtp, :address
  json.extract! dtp, :msg_time
  json.extract! dtp, :pch
  json.extract! dtp, :opisanie
  json.extract! dtp, :asr_opisanie
  json.extract! dtp, :uchastniki
  json.extract! dtp, :technic_pch
  json.extract! dtp, :karaul
  json.url dtp_url(dtp, format: :json)
end