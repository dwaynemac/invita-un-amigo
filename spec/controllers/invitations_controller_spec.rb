require 'spec_helper'

describe InvitationsController do

  describe "GET /new" do
    before do
      get :new
    end
    it { should respond_with 200 }
    it "sets @invitation" do
      assigns(:invitation).should_not be_nil
    end
  end
end
