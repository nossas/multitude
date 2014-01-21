class TaskMailer < ActionMailer::Base
  default from: "Meu Rio <contato@meurio.org.br>"

  def match user, task
    mail(to: user.email, subject: "Uma nova tarefa perfeita para você")
  end
end
