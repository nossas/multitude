class TaskMailer < ActionMailer::Base
  default from: "Meu Rio <contato@meurio.org.br>"

  def match user, task
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"match\"] }"
    @user = user
    @task = task
    mail(to: "#{user.name} <#{user.email}>", subject: "O Multitude tem uma nova tarefa perfeita pra você", from: "#{task.user.name} <#{task.user.email}>")
  end
end
