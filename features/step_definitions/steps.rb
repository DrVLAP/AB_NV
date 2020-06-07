Given /^I go to the (.*?)$/ do |site|
  visit("http://#{site}")
end

def switch_to_last_tab()
  window = page.driver.browser.window_handles
  page.driver.browser.switch_to.window(window.last)
end

Given /^I moving to the market(?: in the (.*?)(?:, (.*?)))?$/ do |section, type|
  find("a[data-id='market']").click
  switch_to_last_tab
  unless section.nil?
    find('span', text: section).click
  end
  puts "'#{type}'"
  unless type.nil?
    find('div a', text: type).click
  end
end

When /^I filter by company: (.*?)$/ do |company|
  within("fieldset[data-autotest-id='7893318']") do
    find('footer button').click
  end
  find("nav input").set(company)
  find('span', text: company).set(true)
end

When /^I filter by price(?: from (\d+))?(?: to (\d+))?$/ do |price_from, price_to|
  find('input#glpricefrom').set(price_from) unless price_from == ''
  find('input#glpriceto').set(price_to) unless price_to == ''
end

When /^I remember first item name$/ do
  @mem_name = first('h3 a').text
end

When /^I open first element page$/ do
  first('h3 a').click
  switch_to_last_tab
end

Then /^Name in the description should be the same as remembered$/ do
  expect(find('div h1').text).to eq(@mem_name)
end