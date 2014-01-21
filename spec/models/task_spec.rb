require 'spec_helper'

describe Task do
  describe "#matches" do
    context "when there is no matching user" do
      its(:matches) { should be_empty }
    end
    context "when there is at least one matching user" do
      let(:user) { User.make! skills: ["a"] }
      before { subject.skills = ["a"] }
      its(:matches) { should include(user) }
    end
  end
end
