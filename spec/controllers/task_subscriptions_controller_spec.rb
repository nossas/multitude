require 'spec_helper'

describe TaskSubscriptionsController do
  describe "#POST create" do
    context "when I'm not logged in" do
      before { Task.stub(:find).with("1").and_return(mock_model(Task, task_subscriptions: double(:task_subscriptions, build: true))) }
      before { post :create, task_id: 1 }

      it "should set the task id session" do
        session[:task_id].should_not be_nil
      end

      it { should redirect_to "#{ENV["ACCOUNTS_HOST"]}?redirect_url=#{root_url}" }
    end
  end
end
