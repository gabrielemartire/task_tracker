FactoryBot.define do
  factory :task, class: 'Task' do
    title { Faker::Lorem.sentence }
    association :project
  end

  factory :no_title_task, class: 'Task' do
    status { 'todo' }
    due_date { Faker::Date.forward(days: 30) }
    association :project
  end

  factory :no_project_task, class: 'Task' do
    title { Faker::Lorem.sentence }
    status { 'todo' }
    priority { 3 }
  end
end
