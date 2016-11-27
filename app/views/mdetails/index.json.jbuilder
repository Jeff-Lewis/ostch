json.array!(@mdetails) do |mdetail|
  json.extract! mdetail, :id, :status
  json.url mdetail_url(mdetail, format: :json)
end
