class DeliveryMailer < ActionMailer::Base
  default from: "Meu Rio <contato@meurio.org.br>"
  
  def new_delivery delivery
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"new_delivery\"] }"
    @delivery = delivery
    mail(to: delivery.task.user.email, subject: "Sua tarefa recebeu uma entrega")
  end

  def accepted delivery
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"accepted\"] }"
    @delivery = delivery
    mail(to: delivery.user.email, subject: "Sua entrega foi aceita")
  end

  def rejected delivery
    headers "X-SMTPAPI" => "{ \"category\": [\"multitude\", \"rejected\"] }"
    @delivery = delivery
    mail(to: delivery.user.email, subject: "Sua entrega foi rejeitada")
  end
end
