require "test_helper"
require "capybara/rails"
require "selenium/webdriver"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # สร้าง Chrome::Options object
  chrome_options = Selenium::WebDriver::Chrome::Options.new
  chrome_options.add_argument("--headless=new")       # headless mode แบบใหม่
  chrome_options.add_argument("--disable-gpu")
  chrome_options.add_argument("--no-sandbox")
  chrome_options.add_argument("--disable-dev-shm-usage")
  chrome_options.add_argument("--window-size=1400,1400")
  chrome_options.add_argument("--user-data-dir=/tmp/chrome-user-data")

  # ใช้ driven_by แบบ object แทน hash
  driven_by :selenium, using: :chrome, screen_size: [ 1400, 1400 ], options: chrome_options
end
