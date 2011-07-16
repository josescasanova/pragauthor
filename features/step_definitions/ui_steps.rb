When /^I look statistics for "([^"]*)"$/ do |name|
  @book_name = name

  steps %Q{
    Then I should see "#{name}"
  }
end

Then /^I should see "([^"]*)" units were sold total$/ do |number|
  within(:xpath, %Q{//div[title="#{@book_name}}) do
    steps %Q{
      Then I should see "total: #{number}"
    }
  end
end

Then /^I should see "([^"]*)" units were sold by "([^"]*)"$/ do |number, vendor|
  within(:css, %Q{div[@title="#{@book_name}"]}) do
    steps %Q{
      Then I should see "#{vendor}: #{number}"
    }
  end
end

Then /^I should see "([^"]*)" units were sold in "([^"]*)"$/ do |number, month|
  within(:css, %Q{div[@title="#{@book_name}"]}) do
    steps %Q{
      Then I should see "#{month}: #{number}"
    }
  end
end

Then /^I should see "([^"]*)" units were sold in "([^"]*)" by "([^"]*)"$/ do |number, month, vendor|
  within(:css, %Q{div[@title='The First Book'] .month[@title*='May']}) do
    steps %Q{
      Then I should see "#{vendor}: #{number}"
    }
  end
end
