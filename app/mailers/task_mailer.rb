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
end
