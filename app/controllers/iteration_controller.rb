class IterationController < ApplicationController
  def create_iteration
  	@iteration = Iteration.new(iteration_params)
  	@iteration.save
  	@iteration
  end

  private
  def iteration_params
  	params.require(:iteration).permit(:name,:start,:end)
  end
end
