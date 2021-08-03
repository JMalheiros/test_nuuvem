require 'capybara/rspec'
require 'selenium-webdriver'

Capybara.register_driver :headless_selenium_chrome_in_container do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w(headless disable-gpu window-size=1440x768) }
  )

  Capybara::Selenium::Driver.new(app,
    :browser => :remote,
    url: "http://selenium_chrome:4444/wd/hub",
    desired_capabilities: capabilities
  )
end

Capybara.register_driver :selenium_chrome_in_container do |app|
  Capybara::Selenium::Driver.new(app,
    :browser => :remote,
    url: "http://selenium_chrome:4444/wd/hub",
    desired_capabilities: :chrome
  )
end

RSpec.configure do |config|
  ...

  config.before(:each, type: :system) do
    Capybara.server_host = '0.0.0.0'
    Capybara.server_port = 4000
    Capybara.app_host = "http://web:4000"
    driven_by(:headless_selenium_chrome_in_container)
  end
end
