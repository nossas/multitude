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
  @delivery.accept!
end

Given(/^my delivery is rejected$/) do
  @delivery.reject!
end

Given(/^there is an user from "(.*?)" with the "(.*?)" skill$/) do |arg1, arg2|
  @user = User.make! skills: ["programacao_de_softwares_e_aplicativos_ou_web"], organizations: [ Organization.find_by(city: arg1) ]
end

Then(/^the user should receive an email$/) do
  ActionMailer::Base.deliveries.select{|d| d.to.include?(@user.email)}.should_not be_empty
end

Then(/^no email should be sent$/) do
  ActionMailer::Base.deliveries.should be_empty
end

Given(/^there is an expired task$/) do
  @task = Task.make! deadline: Time.current - 1.day
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
  @delivery = Delivery.make! task: @task
end

Given(/^I contributed for this task$/) do
  @delivery = Delivery.make! task: @task, user: @current_user
end

Then(/^I should receive an email$/) do
  ActionMailer::Base.deliveries.select{|d| d.to.include?(@current_user.email)}.should_not be_empty
end

Then(/^the email 'I applied for your task' should be sent to the task owner$/) do
  ActionMailer::Base.deliveries.select{|d| d.to.include?(@task.user.email) && d.subject == "Acabo de assumir a tarefa que você criou!"}.should_not be_empty
end

Given(/^there are (\d+) a tasks$/) do |arg1|
  arg1.to_i.times { Task.make! }
end

Then(/^I should see (\d+) tasks$/) do |arg1|
  page.should have_css(".task", count: arg1)
end

Given(/^there is a task type called "(.*?)"$/) do |arg1|
  TaskType.make! name: arg1
end

Given(/^there is an user$/) do
  @user = User.make!
end

Given(/^this user applyied for this task$/) do
  TaskSubscription.make! task: @task, user: @user
end

Given(/^there is an organization in "(.*?)"$/) do |arg1|
  Organization.make! city: arg1
end

Then(/^the user should be rewarded$/) do
  @delivery.user.rewards.count.should eq(1)
end

Then(/^the user should not be rewarded$/) do
  @delivery.user.rewards.count.should eq(0)
end

Then(/^I should be rewarded$/) do
  @current_user.rewards.count.should eq(1)
end

Then(/^I should not be rewarded$/) do
  @current_user.rewards.count.should eq(0)
end
