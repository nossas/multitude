class TaskSubscriptionsController < InheritedResources::Base
  load_and_authorize_resource
  belongs_to :task

  def create
    resource.task = @task
    resource.user = current_user
    create! do |success, failure|
      success.html { redirect_to task_path(@task) }
    end
  end

end
