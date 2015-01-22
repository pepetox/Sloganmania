json.array!(@following) do |following|
  json.extract! following, :username
end
