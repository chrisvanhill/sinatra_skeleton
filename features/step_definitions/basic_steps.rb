Given /^I visit the root page$/ do
  visit '/'
end

When /^I do nothing$/ do
  # do nothing
end

Then /^I should see "([^\"]*)"$/ do |text|
  response_body.should contain(/#{text}/m)
end

