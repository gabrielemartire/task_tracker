require 'rails_helper'

RSpec.describe "Tasks", type: :request do
    # GET
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

    # POST
    describe "POST /tasks" do
        context "with valid parameters" do
            it "creates a new task" do
                project = create(:project)
                
                expect {
                    post project_tasks_path(project), params: { 
                        task: { 
                            title: "Test Task",
                            due_date: Date.tomorrow,
                            priority: 3
                        } 
                    }
                }.to change(Task, :count).by(1)
            end
        end

        context "with invalid parameters" do
            it "does not create a task" do
                project = create(:project)
                
                expect {
                post project_tasks_path(project), params: { 
                    task: { 
                        title: "", # invalid
                        priority: 3
                    } 
                }
                }.not_to change(Task, :count)
            end

            it "returns unprocessable_entity for JSON format" do
                project = create(:project)
                
                post project_tasks_path(project, format: :json), params: { 
                    task: { 
                        title: "",
                        priority: 3
                    } 
                }
                
                expect(response).to have_http_status(:unprocessable_entity)
                expect(response.content_type).to eq("application/json; charset=utf-8")
            end
        end



    end
end