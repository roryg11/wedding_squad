class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You are signed up"
      redirect_to home_path
    else
      render :new
      flash[:alert] = "Your sign up could not be completed."
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
