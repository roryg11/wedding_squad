class RegistrationsController < ApplicationController
  def new
    @token = params[:invite_token]
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @token = params[:invite_token]
    if @user.save
      session[:user_id] = @user.id
      puts "User Saved!"
        if @token != nil
          puts @token
           squad =  Invite.find_by_token(@token).squad #find the user group attached to the invite
           puts squad
           squad.roles.create({user_id: @user.id, role_type: "owner"})
           redirect_to home_path
         else
           redirect_to home_path
        end
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
      :password_confirmation,
      :invite_token
    )
  end

end
