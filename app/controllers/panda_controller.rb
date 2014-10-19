class PandaController < ApplicationController
	def create_panda
		@panda = Panda.new(panda_params)
        if @panda.valid?
			@panda.save 
			respond_to { |format| format.json { render json: @panda} }
		else
            respond_to { |format| format.json { render json: @panda, status: :unprocessable_entity } }
		end
	end

  private

  def panda_params
    params.require(:panda).permit(:name)
  end
end
