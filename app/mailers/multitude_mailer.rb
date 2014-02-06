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
    mail(to: "#{user.name} <#{user.email}>", subject: "Obrigado por assumir esta tarefa no Multitude")
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
    mail(to: "#{task_owner.name} <#{task_owner.email}>", subject: "Acabo de assumir a tarefa que você criou!")
  end
end
