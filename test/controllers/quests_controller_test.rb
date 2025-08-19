require "test_helper"

class QuestsControllerTest < ActionDispatch::IntegrationTest
  include Rails::Controller::Testing::TestProcess
  include Rails::Controller::Testing::TemplateAssertions
  include Rails::Controller::Testing::Integration
  setup do
    @quest = quests(:one)
  end

  # GET /quests
  test "should get index and assign quests and new quest" do
    get quests_url
    assert_response :success
    assert_not_nil assigns(:quests)
    assert_not_nil assigns(:quest)
  end

  # GET /quests/new
  test "should get new and assign quest" do
    get new_quest_url
    assert_response :success
    assert_not_nil assigns(:quest)
  end

  # GET /quests/:id
  test "should show quest" do
    get quest_url(@quest)
    assert_response :success
  end

  # GET /quests/:id/edit
  test "should get edit" do
    get edit_quest_url(@quest)
    assert_response :success
    assert_not_nil assigns(:quest)
  end

  # POST /quests (HTML success)
  test "should create quest (HTML)" do
    assert_difference("Quest.count") do
      post quests_url, params: { quest: { name: "My Quest" } }
    end
    assert_redirected_to quests_url
  end

  # POST /quests (HTML failure)
  test "should render new on create failure (HTML)" do
    post quests_url, params: { quest: { name: "" } }
    assert_response :unprocessable_content
    assert_match /form/, response.body
  end

  # POST /quests (Turbo Stream failure)
  test "should render turbo stream on create failure" do
    post quests_url,
         params: { quest: { name: "" } },
         headers: { "Accept" => "text/vnd.turbo-stream.html" }
    assert_response :unprocessable_content
    assert_match /turbo-stream/, response.body
  end

  # POST /quests (JSON success)
  test "should create quest (JSON)" do
    assert_difference("Quest.count") do
      post quests_url,
           params: { quest: { name: "JSON Quest" } },
           as: :json
    end
    assert_response :created
    json = JSON.parse(response.body)
    assert_equal "JSON Quest", json["name"]
  end

  # POST /quests (JSON failure)
  test "should render errors on create failure (JSON)" do
    post quests_url, params: { quest: { name: "" } }, as: :json
    assert_response :unprocessable_content
    json = JSON.parse(response.body)
    assert_includes json.keys, "name"
  end

  # PATCH /quests/:id (HTML success)
  test "should update quest (HTML)" do
    patch quest_url(@quest), params: { quest: { name: "Updated Quest" } }
    assert_redirected_to quests_url
    @quest.reload
    assert_equal "Updated Quest", @quest.name
  end

  # PATCH /quests/:id (HTML failure)
  test "should render edit on update failure (HTML)" do
    patch quest_url(@quest), params: { quest: { name: "" } }
    assert_response :unprocessable_content
    assert_match /form/, response.body
  end

  # PATCH /quests/:id (Turbo Stream failure)
  test "should render turbo stream on update failure" do
    patch quest_url(@quest),
          params: { quest: { name: "" } },
          headers: { "Accept" => "text/vnd.turbo-stream.html" }
    assert_response :unprocessable_content
    assert_match /turbo-stream/, response.body
  end

  # PATCH /quests/:id (JSON success)
  test "should update quest (JSON)" do
    patch quest_url(@quest), params: { quest: { name: "Updated JSON" } }, as: :json
    assert_response :ok
    @quest.reload
    json = JSON.parse(response.body)
    assert_equal "Updated JSON", json["name"]
  end

  # PATCH /quests/:id (JSON failure)
  test "should render errors on update failure (JSON)" do
    patch quest_url(@quest), params: { quest: { name: "" } }, as: :json
    assert_response :unprocessable_content
    json = JSON.parse(response.body)
    assert_includes json.keys, "name"
  end

  # DELETE /quests/:id (HTML)
  test "should destroy quest (HTML)" do
    assert_difference("Quest.count", -1) do
      delete quest_url(@quest)
    end
    assert_redirected_to quests_url
  end

  # DELETE /quests/:id (JSON)
  test "should destroy quest (JSON)" do
    assert_difference("Quest.count", -1) do
      delete quest_url(@quest), as: :json
    end
    assert_response :no_content
  end

  # DELETE /quests/:id (Turbo Stream)
  test "should destroy quest (Turbo Stream)" do
    assert_difference("Quest.count", -1) do
      delete quest_url(@quest), headers: { "Accept" => "text/vnd.turbo-stream.html" }
    end
    assert_response :success
    assert_match /turbo-stream/, response.body
  end
end
