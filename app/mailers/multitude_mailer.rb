class MultitudeMailer < ActionMailer::Base
  default from: "Meu Rio <contato@meurio.org.br>"
  layout "layouts/mailer"

  def thanks_for_apply_to_this_task task_subscription
    user                      = task_subscription.user
    task                      = task_subscription.task
    task_owner                = task.user
    @user_name                = user.name
    @task_title               = task.title
    @task_url                 = task_url(task)
    @task_deadline            = task.deadline.strftime("%d/%m/%Y, às %H:%M hs")
    @task_owner_phone         = task_owner.phone
    @task_owner_name          = task_owner.name
    @organization             = task.organization
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"thanks_for_apply_to_this_task\"] }"
    mail(to: "#{user.name} <#{user.email}>", subject: "Obrigado por assumir esta tarefa no Multitude", from: "#{task_owner.name} <#{task_owner.email}>")
  end

  def i_applied_for_your_task task_subscription
    user                      = task_subscription.user
    task                      = task_subscription.task
    task_owner                = task.user
    @user_name                = user.name
    @task_owner_name          = task_owner.name
    @task_title               = task.title
    @task_url                 = task_url(task)
    @mobilization_short_title = task.mobilization.short_title
    @task_deadline            = task.deadline.strftime("%d/%m/%Y, às %H:%M hs")
    @task_owner_phone         = task_owner.phone
    @organization             = task.organization
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"i_applied_for_your_task\"] }"
    mail(to: "#{task_owner.name} <#{task_owner.email}>", subject: "Acabo de assumir a tarefa que você criou!", from: "#{user.name} <#{user.email}>")
  end

  def we_have_a_new_task_for_you user, task
    @user_name                = user.name
    @task_owner_name          = task.user.name
    @task_url                 = task_url(task)
    @task_title               = task.title
    @organization             = task.organization
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"we_have_a_new_task_for_you\"] }"
    mail(to: "#{user.name} <#{user.email}>", subject: "O Multitude tem uma nova tarefa perfeita pra você", from: "#{task.user.name} <#{task.user.email}>")
  end

  def no_match task
    @task_owner   = task.user
    @organization = task.organization
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"no_match\"] }"
    mail(to: "#{@task_owner.name} <#{@task_owner.email}>", subject: "Você criou uma tarefa pra ninguém!")
  end

  def new_delivery delivery
    @delivery     = delivery
    @task         = @delivery.task
    @task_owner   = @task.user
    @organization = @task.organization
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"new_delivery\"] }"
    mail(to: delivery.task.user.email, subject: "Tarefa entregue!", from: "#{delivery.user.name} <#{delivery.user.email}>")
  end

  def your_delivery_was_accepted delivery
    task_owner                = delivery.task.user
    user                      = delivery.user
    @user_name                = user.name
    @task_title               = delivery.task.title
    @task_url                 = task_url delivery.task
    @mobilization_short_title = delivery.task.mobilization.short_title
    @task_owner_name          = task_owner.name
    @organization             = delivery.task.organization
    @user_link                = ENV["MEURIO_HOST"] + "/users/#{user.id}"
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"accepted\"] }"
    mail(to: "#{user.name} <#{user.email}>", subject: "Parabéns! Sua tarefa foi validada!", from: "#{task_owner.name} <#{task_owner.email}>")
  end

  def expiring_alert task_subscription
    @user         = task_subscription.user
    @task         = task_subscription.task
    @task_owner   = @task.user
    @organization = @task.organization
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"expiring_alert\"] }"
    mail(to: "#{@user.name} <#{@user.email}>", subject: "Faltam 24 horas para a entrega da sua tarefa no Multitude", from: "#{@task_owner.name} <#{@task_owner.email}>")
  end

  def expired_alert task_subscription
    @user         = task_subscription.user
    @task         = task_subscription.task
    @task_owner   = @task.user
    @organization = @task.organization
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"expired_alert\"] }"
    mail(to: "#{@user.name} <#{@user.email}>", subject: "O prazo de entrega da sua tarefa no Multitude expirou", from: "#{@task_owner.name} <#{@task_owner.email}>")
  end
end
