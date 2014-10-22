json.pairs do |json|
	json.array!(@pairs) do |pair|
		json.extract! pair, :first_panda, :second_panda,:work_done
		json.date_of_pairing(pair.date_of_pairing.strftime('%Y-%m-%d'))
	end
end