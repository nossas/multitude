require 'spec_helper'

describe TaskSubscription do
  before { TaskSubscription.make! }

  it { should belong_to :user }
  it { should belong_to :task }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :task_id }
  it { should validate_uniqueness_of(:task_id).scoped_to :user_id }
end
