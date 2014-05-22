json.array!(@pool_groups) do |pool_group|
  json.extract! pool_group, :id, :poolers
  json.url pool_group_url(pool_group, format: :json)
end
