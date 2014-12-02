class RewardsController < ApplicationController
  def create
    user = User.where(email: params[:user][:email]).first_or_create(
      email: params[:user][:email],
      first_name: params[:user][:first_name],
      last_name: params[:user][:last_name],
    )
    task = Task.find(params[:task_id])
    Reward.create(user_id: user.id, task_id: task.id)

    redirect_to task
  end
end
