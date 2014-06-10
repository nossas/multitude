require "#{Rails.root}/spec/support/blueprints"

class MultitudePreview < ActionMailer::Preview
  def thanks_for_apply_to_this_task
    task_subscription = TaskSubscription.first || TaskSubscription.make!
    MultitudeMailer.thanks_for_apply_to_this_task(task_subscription)
  end
end
