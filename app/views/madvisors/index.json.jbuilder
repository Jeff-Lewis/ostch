json.array!(@madvisors) do |madvisor|
  json.extract! madvisor, :id, :status
  json.url madvisor_url(madvisor, format: :json)
end
