class Api::RolesController < Api::BaseController

  def create
    respond_with :api, Role.create(role_params)
  end

  def update
    role = role.find(params["id"])
    role.update_attributes(role_params)
    respond_with role, :json role
  end

  def destroy
    respond_with Role.destroy(params["id"])
  end

  private
  def role_params
    params.require(:role).require(
      :type,
      :user_id,
      :squad_id
    )
  end

end
