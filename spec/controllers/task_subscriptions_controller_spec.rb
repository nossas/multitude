require 'spec_helper'

describe TaskSubscriptionsController do
  describe "#POST create" do
    context "when I'm not logged in" do
      before { Task.stub(:find).with("1").and_return(mock_model(Task, id: 1, task_subscriptions: double(:task_subscriptions, build: true))) }
      before { post :create, task_id: 1 }
      it { should redirect_to "#{ENV["ACCOUNTS_HOST"]}?redirect_url=#{create_from_session_task_task_subscriptions_url(task_id: 1)}" }
    end
  end
end
