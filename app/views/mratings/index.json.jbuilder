json.array!(@mratings) do |mrating|
  json.extract! mrating, :id, :status
  json.url mrating_url(mrating, format: :json)
end
