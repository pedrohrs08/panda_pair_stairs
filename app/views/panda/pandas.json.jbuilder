json.pandas do |json|
	json.array!(@pandas) do |panda|
	  json.extract! panda, :name
	end
end