class SquadController < ApplicationController

  def new
    @squad = Squad.new
  end

  def create
    @squad = Squad.new(squad_params)
    if @squad.save
      redirect_to home_path
    else
      render :new
      flash[:alert] = "Your squad could not be created."
    end
  end

  private
  def squad_params
    params.require(:squad).permit(
      :name,
      :hashtag
    )
  end
end
