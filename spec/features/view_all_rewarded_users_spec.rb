require "spec_helper"

feature "View all rewarded users", js: true do
  let(:task) { Task.make! }

  scenario "when there is no rewarded user" do
    visit(task_path(task))
    expect(page).to have_css(".rewarded-users .empty")
  end

  scenario "when there is at least one rewarded user" do
    reward = Reward.make! task: task
    visit(task_path(task))

    expect(page).to have_css(".rewarded-user .name", text: reward.user.name)
  end
end
