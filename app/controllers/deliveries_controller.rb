class DeliveriesController < InheritedResources::Base
  load_and_authorize_resource

  def create
    create! do |success, failure|
      success.html { redirect_to task_path(@task) }
    end
  end
end
