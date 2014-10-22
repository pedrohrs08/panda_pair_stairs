class PairController < ApplicationController
	  def create_pair
	  	pair_params[:date_of_pairing] = Date.parse(pair_params[:date_of_pairing])
	  	@pair = Pair.new(pair_params)
		@pair.save
	 	@pair
	  end

	  def get_pairs_within_period
	  	start_date = Date.parse(params[:start_date])
	  	end_date = Date.parse(params[:end_date])
	  	@pairs = Pair.find_within_period(start_date,end_date)
	  end

	  private
	  def pair_params
	    params.require(:pair).permit(:first_panda, :second_panda, :date_of_pairing, :work_done)
	  end
end
