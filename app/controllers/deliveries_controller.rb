class DeliveriesController < InheritedResources::Base
  load_and_authorize_resource
  belongs_to :task

  def create
    resource.user_id = current_user.id
    resource.task_id = @task.id
    create! do |success, failure|
      success.html { redirect_to task_path(@task) }
    end
  end

  def deliver
    resource.delivered_at = Time.now
    update! do |success, failure|
      success.html { redirect_to task_path(@task) }
    end
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
