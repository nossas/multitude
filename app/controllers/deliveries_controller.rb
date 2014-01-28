class DeliveriesController < InheritedResources::Base
  load_and_authorize_resource
  belongs_to :task

  def create
    resource.user_id = current_user.id
    resource.task_id = @task.id
    create! do |success, failure|
      success.html { redirect_to task_path(@task), notice: "Boa sorte na execução da sua tarefa!" }
    end
  end
end
