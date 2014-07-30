require 'spec_helper'

describe ApplicationController do
  describe "#current_user" do
    context "when current user have a session" do
      let(:user) { User.make! }
      before { session[:ssi_user_id] = user.id }

      it "should return an user" do
        expect(subject.current_user).to eq(user)
      end
    end

    context "when current user doesn't have a session" do
      it "should return nil" do
        expect(subject.current_user).to be_nil
      end
    end
  end
end
