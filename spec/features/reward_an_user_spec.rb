require "spec_helper"

feature "Reward an user", js: true do
  let(:task) { Task.make! }
  let(:current_user) { User.make! admin: true }
  before { page.set_rack_session('cas' => {'user' => current_user.email}) }

  scenario "when the user already exists" do
    user = User.make!

    submit_reward_form(
      task: task,
      email: user.email,
      first_name: user.first_name,
      last_name: user.last_name
    )

    sleep(1)

    expect(user.rewards).to have(1).reward
    expect(task.rewards).to have(1).reward
    expect(current_path).to be_eql(task_path(task))
    expect(ActionMailer::Base.deliveries).to_not be_empty
  end

  scenario "when the user doesn't exists" do
    submit_reward_form(
      task: task,
      email: "cr7@trashmail.com",
      first_name: "Cristiano",
      last_name: "Ronaldo"
    )

    sleep(1)

    user = User.find_by_email("cr7@trashmail.com")
    expect(user).to_not be_nil
    expect(user.rewards).to have(1).reward
    expect(task.rewards).to have(1).reward
    expect(current_path).to be_eql(task_path(task))
  end

  scenario "when the user has already been rewarded" do
    user = User.make!
    Reward.make! user: user, task: task

    submit_reward_form(
      task: task,
      email: user.email,
      first_name: user.first_name,
      last_name: user.last_name
    )

    expect(user.rewards).to have(1).reward
    expect(task.rewards).to have(1).reward
    expect(current_path).to be_eql(task_path(task))
  end

  scenario "when the user leaves all fields blank" do
    submit_reward_form(task: task)

    expect(page).to have_css("label.error[for='user_first_name']")
    expect(page).to have_css("label.error[for='user_last_name']")
    expect(page).to have_css("label.error[for='user_email']")
  end

  scenario "when the user doesn't have permission to reward" do
    current_user.update_attribute :admin, false
    visit task_path(task)
    expect(page).to_not have_css("a#reward-button")
  end

  def submit_reward_form(options)
    visit task_path(options[:task])
    click_link "reward-button"
    fill_in "user[first_name]", with: options[:first_name]
    fill_in "user[last_name]", with: options[:last_name]
    fill_in "user[email]", with: options[:email]
    click_button "reward-submit-button"
  end
end
