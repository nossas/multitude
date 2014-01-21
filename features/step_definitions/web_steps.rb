Given(/^I click in "(.*?)"$/) do |arg1|
  click_link to_button(arg1)
end

Given(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in to_field(arg1), with: arg2
end

Given(/^I select "(.*?)" from "(.*?)"$/) do |arg1, arg2|
  select arg1, from: to_field(arg2)
end

Given(/^I check "(.*?)"$/) do |arg1|
  check to_field(arg1)
end

When(/^I press "(.*?)"$/) do |arg1|
  click_button to_button(arg1)
end

When(/^I go to "(.*?)"$/) do |arg1|
  visit to_route arg1
end

Then(/^I should be in "(.*?)"$/) do |arg1|
  expect(page.current_path).to eq to_route(arg1)
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_css(to_element(arg1), text: to_text(arg1))
end