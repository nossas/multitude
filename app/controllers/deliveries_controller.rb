class DeliveriesController < InheritedResources::Base
  load_and_authorize_resource
  belongs_to :task
  belongs_to :task_subscription

  def create
    resource.task_subscription_id = @task_subscription.id
    create! do |success, failure|
      success.html { redirect_to task_path(@task) }
    end
  end

  def deliver
    resource.deliver! file: params[:delivery][:file], text: params[:delivery][:text]
    redirect_to task_path(@task)
  end

  def accept
    resource.accept!
    redirect_to task_path(@task)
  end

  def reject
    resource.reject!
    redirect_to task_path(@task)
  end

  def permitted_params
    {:delivery => params.fetch(:delivery, {}).permit(:text, :file)}
  end
end
