class TaskSubscriptionMailer < ActionMailer::Base
  default from: "Meu Rio <contato@meurio.org.br>"
  layout "layouts/mailer"

  def expiring_alert task_subscription
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"expiring_alert\"] }"
    @user         = task_subscription.user
    @task         = task_subscription.task
    @task_owner   = @task.user
    @mobilization = @task.mobilization
    mail(to: "#{@user.name} <#{@user.email}>", subject: "Faltam 24 horas para a entrega da sua tarefa no Multitude", from: "#{@task_owner.name} <#{@task_owner.email}>")
  end

  def expired_alert task_subscription
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"expired_alert\"] }"
    @user         = task_subscription.user
    @task         = task_subscription.task
    @task_owner   = @task.user
    @mobilization = @task.mobilization
    mail(to: "#{@user.name} <#{@user.email}>", subject: "O prazo de entrega da sua tarefa no Multitude expirou", from: "#{@task_owner.name} <#{@task_owner.email}>")
  end

end
