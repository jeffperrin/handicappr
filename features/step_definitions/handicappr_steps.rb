Given /^I am signed in as "(.*)\/(.*)\/(.*)"$/ do |name, email, password|
  user = UserFactory.create! do |u|
    u.username = name
    u.email = email
    u.password = password
    u.password_confirmation = password
  end
  user.confirm_email!
  When %{I go to the sign in page}
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I press "Sign In"}
end

Given /^a user named "([^\"]*)" exists$/ do |name|
  user = UserFactory.create! do |u|
    u.username = name
  end
end

Then /^I should now be on the home page for "(.*)"$/ do |name|
  assert_equal golfer_path(:user => name), URI.parse(current_url).path
end

Given /^I have at least 1 round$/ do
  RoundFactory.create! do |r|
    r.user = User.first
  end
end

Given /^"([^\"]*)" has 1 round$/ do |name|
  RoundFactory.create! do |r|
    r.user = User.find_by_username(name)
  end
end

Given /^I search for users with "([^\"]*)"$/ do |search_term|
  When %{I go directly to the url /search}
  And %{I fill in "Find a golfer" with "#{search_term}"}
  And %{I press "Search"}
end

