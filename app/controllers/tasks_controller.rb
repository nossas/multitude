class TasksController < InheritedResources::Base
  load_and_authorize_resource

  before_action(only: :show) do
    if current_user.present?
      if current_user.admin?
        @deliveries = @task.deliveries
        @task_subscriptions = @task.task_subscriptions.undelivered
      elsif current_user.subscribed?(@task)
        @deliveries = @task.deliveries.where(task_subscription_id: current_user.task_subscription_for(@task).id)
      end
    end
  end

  # TODO: the check_box helper is adding a hidden skill option with no value and it
  # is been submitted to the create and update actions. We have to figure out what's
  # the best way to supress this hidden checkbox, and then remove this before filter
  before_action(only: [:create, :update]) do
    params[:task][:skills].delete("")
  end

  def index
    if request.xhr?
      render Task.available.order(:deadline).page(params[:page]).per(8)
    else
      @tasks_count = Task.available.count
      render :index
    end
  end

  def create
    resource.user = current_user
    create!
  end

  def permitted_params
    {:task => params.fetch(:task, {}).permit(:title, :description, :max_deliveries, :task_type_id, {:skills => []}, :deadline, :points, :hashtag, :call_to_action, :organization_id)}
  end
end
