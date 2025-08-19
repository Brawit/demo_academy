require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  # ทำ controller ชั่วคราวที่สืบทอดจาก ApplicationController
  controller do
    def index
      render plain: "OK"
    end
  end

  describe "GET #index" do
    it "responds with success" do
      get :index
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq("OK")
    end
  end
end
