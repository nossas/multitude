require 'spec_helper'

describe Task do
  it { should have_many :task_subscriptions }
  it { should validate_presence_of :title }
  it { should validate_presence_of :task_type_id }
  it { should validate_presence_of :points }
  it { should validate_presence_of :description }
  it { should validate_numericality_of(:max_deliveries).is_greater_than 0 }

  describe "#matches" do

    context "when there is no matching user" do
      its(:matches) { should be_empty }
    end

    context "when there is at least one matching user" do
      before { subject.skills = ["a"] }
      let(:user) { User.make! skills: ["a"] }
      its(:matches) { should include(user) }
    end
  end
end
