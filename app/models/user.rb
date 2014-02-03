class User < ActiveRecord::Base
  establish_connection (Rails.env.production? or Rails.env.staging?) ? ENV["ACCOUNTS_DATABASE"] : "accounts_#{Rails.env}"

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

  def applied? task
    Delivery.where("user_id = ? AND task_id = ?", self.id, task.id).any?
  end

  def delivery_for task
    Delivery.where("user_id = ? AND task_id = ?", self.id, task.id).order(:delivered_at).last
  end

  def delivered? task
    delivery = self.delivery_for(task)
    delivery and delivery.delivered_at.present?
  end
end
