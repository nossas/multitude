class TasksController < InheritedResources::Base
  load_and_authorize_resource

  before_action(only: :show) do
    if current_user.present?
      if current_user.admin?
        @deliveries = @task.deliveries
      elsif current_user.subscribed?(@task)
        @deliveries = @task.deliveries.where(task_subscription_id: current_user.task_subscription_for(@task).id)
      end
    end
  end

  def index
    @tasks = Task.available
  end

  def create
    resource.user = current_user
    create!
  end

  def permitted_params
    {:task => params.fetch(:task, {}).permit(:title, :description, :max_deliveries, :task_type_id, {:skills => []}, :deadline, :points, :hashtag)}
  end
end
