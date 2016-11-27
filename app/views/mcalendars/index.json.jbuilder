json.array!(@mcalendars) do |mcalendar|
  json.extract! mcalendar, :id, :status
  json.url mcalendar_url(mcalendar, format: :json)
end
