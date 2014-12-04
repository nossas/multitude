require 'spec_helper'

describe Reward do
  before { Reward.make }

  it { should belong_to :user }
  it { should belong_to :task }
  it { should validate_uniqueness_of(:task_id).scoped_to(:user_id) }

  describe "#sync_reward" do
    subject { Reward.make! }

    context "when the request returns 201" do
      before(:all) { stub_request(:post, "#{ENV["MEURIO_HOST"]}/rewards.json").to_return(status: 201) }
      it "should update the rewarded flag to true" do
        expect(subject).to receive(:update_attribute).with(:rewarded, true)
        subject.sync_reward
      end
    end

    context "when the request doesn't returns 201" do
      before(:all) { stub_request(:post, "#{ENV["MEURIO_HOST"]}/rewards.json").to_return(status: 403) }
      it "should not update the rewarded flag to true" do
        expect(subject).not_to receive(:update_attribute).with(:rewarded, true)
        subject.sync_reward
      end
    end
  end
end
