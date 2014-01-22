class TasksController < InheritedResources::Base
  def permitted_params
    {:task => params.fetch(:task, {}).permit(:title, :description, :min_capacity, :task_type_id, {:skills => []}, :deadline, :points, :material, :handout, :deliverable)}
  end
end
