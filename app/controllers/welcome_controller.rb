class WelcomeController < ApplicationController

  def index
    @current_user = current_user
    @user = User.new
    squads = [];
    Role.where(user_id: current_user.id).find_each do |role|
      Squad.where(id: role.squad_id).find_each do |squad|
        squads.push(squad)
      end
    end

    @squads = squads;
    @users = User.all
  end

  def create
    @invite = User.new(first_name: invite_params[:first_name],
                        last_name: invite_params[:last_name],
                        email: invite_params[:email],
                        avatar: invite_params[:avatar],
                        password: "test")
    if @invite.save
      @role = Role.new(user_id: @invite.id, squad_id: invite_params[:squad], role_type: "Standard")
      if @role.save
        flash[:notice] = "User is signed up"
      else
        flash[:alert] = "Your sign up could not be completed."
      end
    end
    redirect_to home_path
  end

  private
  def invite_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :squad,
      :avatar
    )
  end
end
