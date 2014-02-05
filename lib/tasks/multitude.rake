namespace :task do
  task :expiring_alert => :environment do
    Task.expiring.where(delivered_expiring_alert: false).each do |task|
      task.task_subscriptions.undelivered.each do |task_subscriptions|
        TaskSubscriptionMailer.expiring_alert(task_subscriptions)
      end
      task.update_attribute :delivered_expiring_alert, true
    end
  end
end
