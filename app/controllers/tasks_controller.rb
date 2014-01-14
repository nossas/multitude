class TasksController < InheritedResources::Base
  def permitted_params
    {:task => params.fetch(:task, {}).permit(:title, :description, :min_capacity, :remote, :task_type_id, :skills, :deadline, :points)}
  end
end
