class InvitationsController < ApplicationController

  PASSWORD = 'cervino'

  skip_before_action :verify_authenticity_token
  caches_action :new
  caches_action :show

  def index
    if params[:password] == PASSWORD
      @invitations = Invitation.order(:created_at).all
      render layout: 'admin'
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

  def update
    @invitation = Invitation.find(params[:id])
    respond_to do |format|
      success =  @invitation.update_attributes(invitation_update_params)
      format.json do
        if success
          render json: @invitation, code: 200
        else
          render json: @invitation, code: 400
        end
      end
      format.html do
        if success
          redirect_to invitations_path(password: PASSWORD)
        else
          redirect_to invitations_path(password: PASSWORD)
        end
      end
    end

  end

  def create
    @invitation = Invitation.new(invitation_create_params)
    if @invitation.save
      redirect_to @invitation
    else
      render :new
    end
  end

  private

  def invitation_create_params
    params.require(:invitation).permit(:inviter_name, :invited_name, :invited_email, :invited_phone)
  end

  def invitation_update_params
    params.require(:invitation).permit(:sent)
  end
end
