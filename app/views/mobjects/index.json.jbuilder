json.array!(@mobjects) do |mobject|
  json.extract! mobject, :id, :status
  json.url mobject_url(mobject, format: :json)
end
