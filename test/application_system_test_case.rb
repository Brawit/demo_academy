require "test_helper"
require "capybara/rails"
require "selenium/webdriver"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [ 1400, 1400 ], options: {
    args: %w[
      headless
      disable-gpu
      no-sandbox
      disable-dev-shm-usage
      window-size=1400,1400
      user-data-dir=/tmp/chrome-user-data
    ]
  }
end
