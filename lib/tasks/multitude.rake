namespace :task do
  task :expiring_alert => :environment do
    Task.expiring.where(delivered_expiring_alert: false).each do |task|
      task.task_subscriptions.undelivered.each do |task_subscriptions|
        MultitudeMailer.expiring_alert(task_subscriptions).deliver
      end
      task.update_attribute :delivered_expiring_alert, true
    end
  end

  task :expired_alert => :environment do
    Task.expired.where(delivered_expired_alert: false).each do |task|
      task.task_subscriptions.undelivered.each do |task_subscriptions|
        MultitudeMailer.expired_alert(task_subscriptions).deliver
      end
      task.update_attribute :delivered_expired_alert, true
    end
  end
end
