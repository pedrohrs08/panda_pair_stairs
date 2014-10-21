class PairController < ApplicationController
	  def create_pair
	  	pair_params[:date_of_pairing] = Date.parse(pair_params[:date_of_pairing])
	  	@pair = Pair.new(pair_params)
		@pair.save
		p @pair.errors
	 	respond_to do |format|
	 	   	format.json { render json: { pair: @pair, errors: @pair.errors } }
	 	end
	  end

	  private
	  def pair_params
	    params.require(:pair).permit(:first_panda, :second_panda, :date_of_pairing, :work_done)
	  end
end
