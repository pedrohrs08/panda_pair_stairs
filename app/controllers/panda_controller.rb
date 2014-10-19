class PandaController < ApplicationController
	def create_panda
		@panda = Panda.new(panda_params)
		@panda.save if @panda.valid?
		respond_to { |format| format.json { render json: @panda} }
	end

  private

  def panda_params
    params.require(:panda).permit(:name)
  end
end
