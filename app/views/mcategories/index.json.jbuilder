json.array!(@mcategories) do |mcategory|
  json.extract! mcategory, :id, :status
  json.url mcategory_url(mcategory, format: :json)
end
