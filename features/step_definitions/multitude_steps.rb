Given(/^I'm logged in$/) do
  @current_user = User.make! email: "ssi@meurio.org.br"
  visit root_path
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
