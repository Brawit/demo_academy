require "test_helper"

class ExampleJobTest < ActiveJob::TestCase
  test "can enqueue a job" do
    assert_enqueued_with(job: ExampleJob) do
      ExampleJob.perform_later
    end
  end

  test "can perform a job" do
    assert_performed_jobs 1 do
      ExampleJob.perform_later
    end
  end
end
