class ExampleJob < ApplicationJob
  def perform
    # logic ตัวอย่าง
    Rails.logger.info "Job performed"
  end
end
