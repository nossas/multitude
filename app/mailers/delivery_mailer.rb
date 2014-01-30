class DeliveryMailer < ActionMailer::Base
  default from: "Meu Rio <contato@meurio.org.br>"
  
  def new_delivery delivery
    @delivery = delivery
    mail(to: delivery.task.user.email, subject: "Sua tarefa recebeu uma entrega")
  end
end
