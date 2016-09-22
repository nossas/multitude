class User < ActiveRecord::Base
  acts_as_our_cities_user

  attr_accessor :password

  has_many :task_subscriptions
  has_many :deliveries
  has_many :memberships, inverse_of: :user
  has_many :organizations, through: :memberships
  has_many :rewards
  has_many :user_interests
  has_many :interests, through: :user_interests

  def subscribed? task
    self.task_subscriptions.where(task_id: task.id).any?
  end

  def task_subscription_for task
    self.task_subscriptions.find_by_task_id task.id
  end

  def delivered? task
    self.deliveries.where("deliveries.task_id = ?", task.id).any?
  end

  def accepted_delivery_for? task
    self.deliveries.where("deliveries.task_id = ? AND deliveries.accepted_at IS NOT NULL", task.id).any?
  end

  def pending_delivery_for? task
    self.deliveries.where("deliveries.task_id = ? AND deliveries.accepted_at IS NULL AND deliveries.rejected_at IS NULL", task.id).any?
  end

  # TODO: remove this method
  def ready_to_deliver? task
    true
  end

  def self.find_or_create_from_auth_hash(auth_hash)
    user = self.find_or_initialize_by(provider: auth_hash[:provider], uid: auth_hash[:uid].to_s)
    user.update_attributes(email: auth_hash[:info][:email]) unless user.email
    user
  end
end
