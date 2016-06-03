class RegistrationsController < ApplicationController
  def new
    @user = User.new
    @token = params[:invite_token]
  end

  def create
    @user = User.new(user_params)
    @token = params[:invite_token]
    if @user.save
      session[:user_id] = @user.id
        if @token != nil
           squad =  Invite.find_by_token(@token).squad #find the user group attached to the invite
           squad.roles.create({user_id: @user.id, role_type: "owner"})
        end
        redirect_to home_path
    else
      render json: @user, status: @user.errors
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :bio,
      :password,
      :password_confirmation
    )
  end

end
