require 'spec_helper'

describe Delivery do
  it { should validate_presence_of :task_subscription_id }
end
