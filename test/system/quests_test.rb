require "application_system_test_case"

class QuestsTest < ApplicationSystemTestCase
  setup do
    @quest = quests(:one)
  end

  test "visiting the index" do
    visit quests_url
    assert_selector "h1", text: "My Todo-list"
  end

  test "should create quest" do
    visit quests_url

    # เข้าไปใน frame ของ form
    within("turbo-frame#new_quest_form") do
      fill_in "Name", with: "My Quest"
      click_on "Create Quest"
    end

    # ตรวจสอบว่าหน้าแสดง quest ใหม่
    assert_text "My Quest"
  end

  test "should destroy Quest" do
    visit quest_url(@quest)

    accept_confirm do
      click_on "Destroy this quest", match: :first
    end

    # ตรวจสอบว่า quest หายไปจากหน้า
    assert_no_text @quest.name
  end
end
