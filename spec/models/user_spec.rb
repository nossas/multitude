require 'spec_helper'

describe User do
  describe "#applied?" do
    let(:task) { Task.make! }
    subject { User.make! }

    context "when the user didn't applied for any task" do
      it "should be false" do
        subject.applied?(task).should == false
      end
    end

    context "when the user applied for the task" do
      before { Delivery.make! user: subject, task: task }
      it "should be true" do
        subject.applied?(task).should == true
      end
    end

    context "when the user applied for another task" do
      before { Delivery.make! user: subject }
      it "should be false" do
        subject.applied?(task).should == false
      end
    end

  end
end
