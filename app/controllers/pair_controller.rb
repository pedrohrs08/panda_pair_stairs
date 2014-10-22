class PairController < ApplicationController
	  def create_pair
	  	pair_params[:date_of_pairing] = Date.parse(pair_params[:date_of_pairing])
	  	@pair = Pair.new(pair_params)
		@pair.save
	 	@pair
	  end

	  private
	  def pair_params
	    params.require(:pair).permit(:first_panda, :second_panda, :date_of_pairing, :work_done)
	  end
end
