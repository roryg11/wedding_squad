class Api::InvitesController < Api::BaseController
  def create
    @invite = Invite.create(invite_params)
    @invite.sender_id = current_user.id
    if @invite.save
      if @invite.recipient != nil
         #send a notification email
         InviteMailer.existing_user_invite(@invite).deliver
         #Add the user to the user group
         @invite.recipient.user_groups.push(@invite.user_group)
         respond_with @invite
      else
         InviteMailer.new_user_invite(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver
         respond_with @invite
      end
    else
      respond_with @invite.errors
    end
  end

  private
  def invite_params
    params.require(:invite).permit(:email, :squad_id)
  end
end
