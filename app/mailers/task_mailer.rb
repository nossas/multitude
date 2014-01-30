class TaskMailer < ActionMailer::Base
  default from: "Meu Rio <contato@meurio.org.br>"

  def match user, task
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"match\"] }"
    mail(to: user.email, subject: "Uma nova tarefa perfeita para você")
  end
end
