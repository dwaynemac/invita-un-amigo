class InvitationsController < ApplicationController

  PASSWORD = 'cervino'

  caches_action :new

  def index
    if params[:password] == PASSWORD
      @invitations = Invitation.all
    else
      redirect_to root_url
    end
  end

  def show
    @invitation = Invitation.find(params[:id])
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      redirect_to @invitation
    else
      render :new
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:inviter_name, :invited_name, :invited_email)
  end
end
