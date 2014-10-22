class PandaController < ApplicationController
	def create_panda
		@panda = Panda.new(panda_params)
		@panda.save
 	    @panda
	end

	def pandas
		@pandas = Panda.all
	end

  private

  def panda_params
    params.require(:panda).permit(:name)
  end
end
