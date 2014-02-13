class MultitudeMailer < ActionMailer::Base
  default from: "Meu Rio <contato@meurio.org.br>"
  layout "layouts/mailer"

  def thanks_for_apply_to_this_task task_subscription
    user = task_subscription.user
    task = task_subscription.task
    task_owner = task.user
    @user_name = user.name
    @task_title = task.title
    @task_url = task_url(task)
    @mobilization_short_title = task.mobilization.short_title
    @task_deadline = task.deadline.strftime("%d/%m/%Y, às %H:%M hs")
    @task_owner_phone = task_owner.phone
    @task_owner_name = task_owner.name

    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"thanks_for_apply_to_this_task\"] }"
    mail(to: "#{user.name} <#{user.email}>", subject: "Obrigado por assumir esta tarefa no Multitude", from: "#{task_owner.name} <#{task_owner.email}>")
  end

  def i_applied_for_your_task task_subscription
    user = task_subscription.user
    task = task_subscription.task
    task_owner = task.user
    @user_name = user.name
    @task_owner_name = task_owner.name
    @task_title = task.title
    @task_url = task_url(task)
    @mobilization_short_title = task.mobilization.short_title
    @task_deadline = task.deadline.strftime("%d/%m/%Y, às %H:%M hs")
    @task_owner_phone = task_owner.phone

    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"i_applied_for_your_task\"] }"
    mail(to: "#{task_owner.name} <#{task_owner.email}>", subject: "Acabo de assumir a tarefa que você criou!", from: "#{user.name} <#{user.email}>")
  end

  def we_have_a_new_task_for_you user, task
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"match\"] }"

    @user_name                = user.name
    @task_owner_name          = task.user.name
    @task_url                 = task_url(task)
    @task_title               = task.title
    @mobilization_short_title = task.mobilization.short_title

    mail(to: "#{user.name} <#{user.email}>", subject: "O Multitude tem uma nova tarefa perfeita pra você", from: "#{@sender.name} <#{@sender.email}>")
  end

  def no_match task
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"no_match\"] }"
    @task_owner   = task.user
    mail(to: "#{@task_owner.name} <#{@task_owner.email}>", subject: "Você criou uma tarefa pra ninguém!")
  end

  def new_delivery delivery
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"new_delivery\"] }"
    @delivery = delivery
    mail(to: delivery.task.user.email, subject: "Sua tarefa recebeu uma entrega", from: "#{delivery.user.name} <#{delivery.user.email}>")
  end

  def accepted delivery
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"accepted\"] }"

    @delivery     = delivery
    @user         = @delivery.user
    @task         = @delivery.task
    @task_owner   = @task.user
    @mobilization = @task.mobilization

    mail(to: "#{@user.name} <#{@user.email}>", subject: "Parabéns! Sua tarefa foi validada!", from: "#{@task_owner.name} <#{@task_owner.email}>")
  end

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
