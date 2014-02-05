class TaskMailer < ActionMailer::Base
  default from: "Meu Rio <contato@meurio.org.br>"
  layout "layouts/mailer"

  def match user, task
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"match\"] }"

    @user         = user
    @task         = task
    @mobilization = task.mobilization

    mail(to: "#{user.name} <#{user.email}>", subject: "O Multitude tem uma nova tarefa perfeita pra você", from: "#{task.user.name} <#{task.user.email}>")
  end

  def no_match task
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"no_match\"] }"
    @task_owner   = task.user
    mail(to: "#{@task_owner.name} <#{@task_owner.email}>", subject: "Você criou uma tarefa pra ninguém!")
  end
end
