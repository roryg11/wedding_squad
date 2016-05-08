class Api::UsersController < BaseController

  def create
    respond_with :api, User.create(user_params)
  end

  def update
    user = User.find(params["id"])
    user.update_attributes(user_params)
    respond_with user, json: user
  end

  def destroy
    respond_with User.destroy(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(
    :first_name,
    :last_name,
    :email,
    :bio
    )
  end

end
