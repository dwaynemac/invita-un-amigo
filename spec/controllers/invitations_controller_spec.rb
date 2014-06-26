require 'spec_helper'

describe InvitationsController do

  render_views

  describe "GET /invitations/:id" do
    let(:invitation){Invitation.create!(inviter_name: 'dw', invited_name: 'kev', invited_email: 'kev@h.c')}
    before do
      get :show, id: invitation.id
    end
    it { should respond_with 200 }
  end

  describe "GET /invitations/new" do
    before do
      get :new
    end
    it { should respond_with 200 }
    it "sets @invitation" do
      assigns(:invitation).should_not be_nil
    end
  end

  describe "POST /invitations" do
    describe "with valid attributes" do
      let(:attributes){{ inviter_name: 'dwayne', invited_name: 'kevin', invited_email: 'kevin@hampton.com' }}
      before do
        @invitations_count = Invitation.count
        post :create, invitation: attributes
      end
      it { should redirect_to assigns(:invitation) }
      it "creates a new invitation" do
        Invitation.count.should == @invitations_count+1
      end
    end
    describe "with INvalid attributes" do
      let(:attributes){{ inviter_name: nil, invited_name: 'kevin', invited_email: 'kevin@hampton.com' }}
      before do
        @invitations_count = Invitation.count
        post :create, invitation: attributes
      end
      it { should respond_with 200 }
      it "does not create a new invitation" do
        Invitation.count.should == @invitations_count
      end
    end
  end
end
