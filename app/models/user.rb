class User < ActiveRecord::Base
  has_many :task_subscriptions
  has_many :deliveries, through: :task_subscriptions

  def avatar_url
    if self.avatar
      "https://#{ENV['ACCOUNTS_BUCKET']}.s3.amazonaws.com/uploads/user/avatar/#{self.id}/square_#{self.avatar}"
    else
      "http://i.imgur.com/lsAFCHL.jpg"
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  def subscribed? task
    self.task_subscriptions.where(task_id: task.id).any?
  end

  def task_subscription_for task
    self.task_subscriptions.find_by_task_id task.id
  end

  def delivered? task
    Delivery.joins(:task_subscription).where("task_subscriptions.user_id = ? AND task_subscriptions.task_id = ?", self.id, task.id).any?
  end

  def accepted_delivery_for? task
    Delivery.joins(:task_subscription).where("task_subscriptions.user_id = ? AND task_subscriptions.task_id = ? AND deliveries.accepted_at IS NOT NULL", self.id, task.id).any?
  end

  def pending_delivery_for? task
    Delivery.joins(:task_subscription).where("task_subscriptions.user_id = ? AND task_subscriptions.task_id = ? AND deliveries.accepted_at IS NULL AND deliveries.rejected_at IS NULL", self.id, task.id).any?
  end

  def ready_to_deliver? task
    self.subscribed?(task) && !self.accepted_delivery_for?(task) && !self.pending_delivery_for?(task)
  end
end
