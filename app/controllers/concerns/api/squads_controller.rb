class Api::SquadsController < Api::BaseController
  def create
    squad = Squad.create(squad_params)
    if squad.save
      squad.roles.create({user_id: current_user.id, role_type: "owner"})
      respond_with :api, squad
    else
      repond_with json: error, status: error.status
    end
  end

  def index
    squads = Squad.all
    respond_with squads
  end

  def update
    squad = Squad.find(params["id"])
    squad.update_attributes(squad_params)
    respond_with squad, json: squad
  end

  def show_all_squads
    respond_with current_user.squads
  end

  def show_owned_squads
    owner_role = Role.where({user_id: current_user.id, role_type: "owner"})
    squad = owner_role[0].squad
    respond_with squad, json: squad
  end

  def squad_m
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
  def role_params
    params.require(:role).permit(
      :role_name,
      :user_id,
      :squad_id
    )
  end
end
