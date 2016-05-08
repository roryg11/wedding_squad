class Api::SquadsController < Api::BaseController
  def create
    squad = Squad.create(squad_params)
    if squad.save
      Role.create({
        user_id: current_user,
        squad_id: squad.id,
        role_name: "owner"
      })
      respond_with :api, squad
    else
      repond_with json: error, status: error.status
    end
  end

  def update
    squad = Squad.find(params["id"])
    squad.update_attributes(squad_params)
    respond_with squad, json: squad
  end

  def show_all_squads
    respond_with current_user.squads
  end

  def squad_members
    squad = Squad.find(params["id"])
    users = squad.users
    respond_with users
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
