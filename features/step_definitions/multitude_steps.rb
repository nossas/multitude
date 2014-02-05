Given(/^I'm logged in$/) do
  @current_user = User.make! email: "ssi@meurio.org.br"
  visit root_path
end

Given(/^I'm logged in as admin$/) do
  @current_user = User.make! email: "ssi@meurio.org.br", admin: true
  visit root_path
end

Given(/^there is a task$/) do
  @task = Task.make!
end

Given(/^my delivery is accepted$/) do
  @delivery.update_attributes accepted_at: Time.now
end

Given(/^my delivery is rejected$/) do
  @delivery.update_attributes rejected_at: Time.now
end

Given(/^there is an user with the "(.*?)" skill$/) do |arg1|
  @user = User.make! skills: ["programacao_de_softwares_e_aplicativos_ou_web"]
end

Then(/^the user should receive an email$/) do
  ActionMailer::Base.deliveries.select{|d| d.to.include?(@user.email)}.should_not be_empty
end

Then(/^no email should be sent$/) do
  ActionMailer::Base.deliveries.should be_empty
end

Given(/^there is an expired task$/) do
  @task = Task.make! deadline: Time.now - 1.day
end

Given(/^there is a mobilization called "(.*?)"$/) do |arg1|
  @mobilization = Mobilization.make! short_title: arg1
end

Given(/^I subscribed for this task$/) do
  @task_subscription = TaskSubscription.make! task: @task, user: @current_user
end

Then(/^an email should be sent to the creator of the task$/) do
  ActionMailer::Base.deliveries.select{|d| d.to.include?(@task.user.email)}.should_not be_empty
end

Then(/^an email should be sent to the creator of the delivery$/) do
  ActionMailer::Base.deliveries.select{|d| d.to.include?(@delivery.user.email)}.should_not be_empty
end

Given(/^there is a full task$/) do
  @task = Task.make! max_deliveries: 1
  TaskSubscription.make! task: @task
end

Given(/^somebody contributed for this task$/) do
  @task_subscription = TaskSubscription.make! task: @task
  @delivery = Delivery.make! task_subscription: @task_subscription
end

Given(/^I contributed for this task$/) do
  @task_subscription = TaskSubscription.make! task: @task
  @delivery = Delivery.make! task_subscription: @task_subscription, user: @current_user
end

Then(/^I should receive an email$/) do
  ActionMailer::Base.deliveries.select{|d| d.to.include?(@current_user.email)}.should_not be_empty
end
