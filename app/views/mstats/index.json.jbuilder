json.array!(@mstats) do |mstat|
  json.extract! mstat, :id, :status
  json.url mstat_url(mstat, format: :json)
end
