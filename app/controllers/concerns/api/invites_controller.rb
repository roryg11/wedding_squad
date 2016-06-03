class Api::InvitesController < Api::BaseController
  def create
    @invite = Invite.create(invite_params)
    if @invite.save
      if @invite.recipient != nil
        #send a notification email
        InviteMailer.existing_user_invite(@invite).deliver
        #Add the user to the user group
        Role.create({user_id: @invite.recipient.id, squad_id: @invite.squad_id, role_type: "owner"})
      else
        InviteMailer.new_owner_invite(@invite, signup_url(:invite_token => @invite.token)).deliver_later
      end
    else
      respond_with @invite.errors
    end
  end

  private
  def invite_params
    params.require(:invite).permit(:email, :squad_id, :sender_id)
  end
end
