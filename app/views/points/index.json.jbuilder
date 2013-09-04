json.array!(@points) do |point|
  json.extract! point, 
  json.url point_url(point, format: :json)
end
