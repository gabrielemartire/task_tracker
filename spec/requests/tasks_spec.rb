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

    #PATCH
    describe "PATCH /tasks/:id" do
        context 'with valid parameters' do
            it 'update a task' do
                project = create(:project)
                task = create(:task)

                patch project_task_path(project, task), params: {
                    task: {
                        title: "updated task title"
                    }
                }
                task.reload
                expect(task.title).to eq("updated task title")
            end

            it "return success status for JSON format" do
                project = create(:project)
                task = create(:task)

                patch project_task_path(project, task, format: :json), params: {
                    task: {
                        title: "updated task title"
                    }
                }

                expect(response).to have_http_status(:ok)
                expect(response.content_type).to eq("application/json; charset=utf-8") 
            end
        end

        context 'with invalid parameters' do
            it 'does not update a task' do
                project = create(:project)
                task = create(:task)
                old_title_task = task.title

                patch project_task_path(project, task), params: {
                    task: {
                        title: ""
                    }
                }
                task.reload
                expect(task.title).to eq(old_title_task)
            end

            it "return unprocessable_entity for JSON format" do
                project = create(:project)
                task = create(:task)

                patch project_task_path(project, task, format: :json), params: {
                    task: {
                        title: ""
                    }
                }

                expect(response).to have_http_status(:unprocessable_entity)
                expect(response.content_type).to eq("application/json; charset=utf-8")
            end
        end
    end
end