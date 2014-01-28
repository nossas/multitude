class User < ActiveRecord::Base
  establish_connection Rails.env.production? ? ENV["ACCOUNTS_DATABASE"] : "accounts_#{Rails.env}"

  def avatar_url
    if self.avatar
      "https://meurio-accounts.s3.amazonaws.com/uploads/user/avatar/#{self.id}/square_#{self.avatar}"
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
end
