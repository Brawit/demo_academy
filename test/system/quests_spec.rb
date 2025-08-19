# spec/system/quests_spec.rb
require "rails_helper"

RSpec.describe "Quests", type: :system do
  # สร้าง quest สำหรับทดสอบแบบ dynamic
  let!(:quest) { Quest.create!(name: "Existing Quest") }

  before do
    driven_by(:selenium_chrome)
  end

  it "visits the index" do
    visit quests_path
    expect(page).to have_selector("h1", text: "My Todo-list")
  end

  it "creates a quest" do
    visit quests_path

    within("turbo-frame#new_quest_form") do
      fill_in "Name", with: "My Quest"
      click_on "Create Quest"
    end

    expect(page).to have_text("My Quest")
  end

  it "destroys a quest" do
    visit quest_path(quest)

    accept_confirm do
      click_on "Destroy this quest", match: :first
    end

    expect(page).not_to have_text(quest.name)
  end
end
