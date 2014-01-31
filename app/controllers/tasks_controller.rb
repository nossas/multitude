class TasksController < InheritedResources::Base
  load_and_authorize_resource
  before_action(only: :show) { @deliveries = @task.deliveries.where("delivered_at IS NOT NULL").order(:delivered_at) }

  def create
    resource.user = current_user
    create!
  end

  def permitted_params
    {:task => params.fetch(:task, {}).permit(:title, :description, :max_deliveries, :task_type_id, {:skills => []}, :deadline, :points, :hashtag)}
  end
end
