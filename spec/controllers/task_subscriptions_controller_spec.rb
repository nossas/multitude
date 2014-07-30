require 'spec_helper'

describe TaskSubscriptionsController do
  describe "#POST create" do
    context "when I'm not logged in" do
      before { allow(Task).to receive(:find).and_return(mock_model(Task, id: 1, task_subscriptions: double(:task_subscriptions, build: true))) }

      it "redirects to login" do
        post :create, task_id: 1
        expect(response).to redirect_to "#{ENV["CAS_SERVER_URL"]}?service=#{create_from_session_task_task_subscriptions_url(task_id: 1)}"
      end
    end
  end
end
