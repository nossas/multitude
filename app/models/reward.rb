class Reward < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  validates :task_id, uniqueness: { scope: :user_id }

  after_create { self.delay.sync_reward }
  after_create { MultitudeMailer.delay.your_delivery_was_accepted(self) }

  def sync_reward
    begin
      url = "#{ENV["MEURIO_HOST"]}/rewards.json"
      reward = { task_type_id: self.task.task_type.id, user_id: self.user.id, points: self.task.points, source_app: "Multitude", source_model: "Reward", source_id: self.id }
      body = { token: ENV["MEURIO_API_TOKEN"], reward: reward }
      response = HTTParty.post(url, body: body)
      self.update_attribute :rewarded, true if response.code == 201
    rescue Exception => e
      Appsignal.add_exception e
      logger.error e.message
    end
  end
end
