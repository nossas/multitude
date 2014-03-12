module ApplicationHelper
  def submit_delivery_button_text current_user, task
    default = t("count.deliver", count: current_user.task_subscription_for(task).deliveries.count)
    task.call_to_action.present? ? task.call_to_action : default
  end
end
