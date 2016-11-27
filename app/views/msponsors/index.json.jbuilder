json.array!(@msponsors) do |msponsor|
  json.extract! msponsor, :id, :status
  json.url msponsor_url(msponsor, format: :json)
end
