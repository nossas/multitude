class TasksController < InheritedResources::Base
  load_and_authorize_resource

  def permitted_params
    {:task => params.fetch(:task, {}).permit(:title, :description, :max_deliveries, :task_type_id, {:skills => []}, :deadline, :points, :hashtag)}
  end
end
