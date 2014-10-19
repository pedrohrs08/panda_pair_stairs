json.array!(@pandas) do |panda|
  json.extract! panda, :name
end