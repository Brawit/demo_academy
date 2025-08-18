require "test_helper"

class QuestsIntegrationTest < ActionDispatch::IntegrationTest
  setup do
    @quest = quests(:one)
  end

  test "should create a quest" do
    assert_difference("Quest.count") do
      post quests_url, params: { quest: { name: "My Quest", is_done: false } }
    end

    # controller redirect ไป index page
    assert_redirected_to quests_path
    follow_redirect!
    assert_response :success
    assert_select "span", text: "My Quest"
  end

  test "should update a quest" do
    patch quest_url(@quest), params: { quest: { name: "Updated Quest", is_done: true } }

    assert_redirected_to quests_path
    follow_redirect!
    assert_response :success
    assert_select "span", text: "Updated Quest"
  end

  test "should destroy a quest" do
    assert_difference("Quest.count", -1) do
      delete quest_url(@quest)
    end

    assert_redirected_to quests_path
    follow_redirect!
    assert_response :success
    # ไม่ต้องตรวจสอบ HTML ของ Turbo
  end
end
