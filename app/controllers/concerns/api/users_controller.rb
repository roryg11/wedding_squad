class Api::UsersController < Api::BaseController

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

  def current_user
    return unless session[:user_id]
    current_user ||= User.find(session[:user_id])
    respond_with current_user
  end

  # def authenticate_user
  #   if !current_user
  #     redirect_to signin_path, notice: "You must be signed in to do that!"
  #   end
  # end

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
