require 'spec_helper'

describe User do
  it { should have_many :task_subscriptions }

  describe "#subscribed?" do
    subject { User.make! }
    let(:task) { Task.make! }

    context "when the user didn't subscribed to the task" do
      it "should be false" do
        subject.subscribed?(task).should be == false
      end
    end

    context "when the user subscribed to a task" do
      before { TaskSubscription.make! user: subject, task: task }

      it "should be true" do
        subject.subscribed?(task).should be == true
      end
    end
  end
end
