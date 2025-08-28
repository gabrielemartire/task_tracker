require 'rails_helper'

RSpec.describe "Tasks", type: :request do
    # index test
    describe "GET /tasks" do
        it "returns http success" do
        get "/tasks"
        expect(response).to have_http_status(:success)
        end

        it "returns tasks in JSON format" do
            task = create(:task)
        
            get "/tasks.json"
            expect(response.content_type).to eq("application/json; charset=utf-8")
        end
    end
end