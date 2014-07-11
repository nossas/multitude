class TaskSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  has_many :deliveries

  validates :user_id, :task_id, presence: true
  validates :task_id, uniqueness: { scope: :user_id }

  scope :undelivered, -> { joins('LEFT OUTER JOIN deliveries ON deliveries.task_subscription_id = task_subscriptions.id').where("deliveries.id IS NULL") }

  after_create { MultitudeMailer.delay.thanks_for_apply_to_this_task(self) }
  after_create { MultitudeMailer.delay.i_applied_for_your_task(self) }
  after_create { self.delay.add_to_segment }

  def add_to_segment
    begin
      url = "#{ENV["ACCOUNTS_HOST"]}/users/#{self.user_id}/segment_subscriptions.json"
      body = { 
        token: ENV["ACCOUNTS_API_TOKEN"], 
        segment_subscription: { 
          organization_id: self.task.organization_id, 
          segment_id: self.task.organization.multitude_mailchimp_segment_id 
        }
      }
      HTTParty.post(url, body: body.to_json, headers: { 'Content-Type' => 'application/json' })
    rescue Exception => e
      logger.error e.message
    end
  end
end
