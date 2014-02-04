class DeliveryMailer < ActionMailer::Base
  default from: "Meu Rio <contato@meurio.org.br>"
  layout "layouts/mailer"
  
  def new_delivery delivery
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"new_delivery\"] }"
    @delivery = delivery
    mail(to: delivery.task.user.email, subject: "Sua tarefa recebeu uma entrega")
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

  def rejected delivery
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"rejected\"] }"
    @delivery = delivery
    mail(to: delivery.user.email, subject: "Sua entrega foi rejeitada")
  end

end
