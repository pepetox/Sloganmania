json.array!(@followers) do |follower|
  json.extract! follower, :username
end
