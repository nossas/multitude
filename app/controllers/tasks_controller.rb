class TasksController < InheritedResources::Base
  load_and_authorize_resource

  # TODO: the check_box helper is adding a hidden skill option with no value and it
  # is been submitted to the create and update actions. We have to figure out what's
  # the best way to supress this hidden checkbox, and then remove this before filter
  # UPDATE: Rails team thinks this is the desirable behaviour (https://github.com/rails/rails/issues/12605)
  before_action(only: [:create, :update]) do
    params[:task][:skills].delete("")
  end

  def index
    if request.xhr?
      render Task.order("deadline DESC").page(params[:page]).per(8)
    else
      @tasks_count = Task.available.count
      render :index
    end
  end

  def create
    resource.user = current_user
    resource.skills = params[:task][:skills]
    create!
  end

  def show
    @deliveries = @task.deliveries
    @task_subscriptions = @task.task_subscriptions.undelivered if current_user.try(:admin?)
    @subscribers = @task.subscribers
    @reward = Reward.new
  end

  def permitted_params
    {:task => params.fetch(:task, {}).permit(:title, :description, :max_deliveries, :task_type_id, {:skills => []}, :deadline, :points, :hashtag, :call_to_action, :organization_id)}
  end
end
