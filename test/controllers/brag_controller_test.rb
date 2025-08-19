require "test_helper"

class BragControllerTest < ActionDispatch::IntegrationTest
  # ถ้า BragController ยังไม่มี action ใด ๆ แค่เรียก controller ก็ถือว่า cover class ได้
  test "should get index" do
    # สมมติว่าเราจะสร้าง route สำหรับ index
    get brag_index_url
    assert_response :success
  end
end
