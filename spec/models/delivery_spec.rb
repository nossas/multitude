require 'spec_helper'

describe Delivery do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :task_id }
end
