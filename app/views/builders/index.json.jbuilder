json.array!(@builders) do |builder|
  json.extract! builder, :id, :name, :address, :phone, :website
  json.url builder_url(builder, format: :json)
end
