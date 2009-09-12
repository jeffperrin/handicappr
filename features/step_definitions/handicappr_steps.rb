Given /^I am signed in as "(.*)\/(.*)\/(.*)"$/ do |name, email, password|
  user = UserFactory.create! do |u|
    u.name = name
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

Then /^I should now be on the home page for "(.*)"$/ do |name|
  assert_equal golfer_path(:user => name), URI.parse(current_url).path
end