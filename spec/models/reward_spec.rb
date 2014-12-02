require 'spec_helper'

describe Reward do
  it { should belong_to :user }
  it { should belong_to :task }
  it { should validate_uniqueness_of(:task_id).scoped_to(:user_id) }
end
