class Api::SquadsController < BaseController
  def create
    respond_with :api, Squad.create(squad_params)
  end

  def update
    squad = Squad.find(params["id"])
    squad.update_attributes(squad_params)
    respond_with squad, json: squad
  end

  def destroy
    respond_with Squad.destroy(params["id"])
  end

  private
  def squad_params
    params.require(:squad).permit(
      :name,
      :hashtag
    )
  end
end
