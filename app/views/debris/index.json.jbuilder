json.array!(@debris) do |debri|
  json.extract! debri, :id, :word, :size, :height, :angle, :object_type_id, :deleted
  json.url debri_url(debri, format: :json)
end
