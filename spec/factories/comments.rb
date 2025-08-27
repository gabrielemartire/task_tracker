FactoryBot.define do  
  factory :comment do
    body { Faker::Lorem.sentence }
    author_name { Faker::Name.name }
    association :task
  end

  factory :no_body_comment, class: 'Comment' do
    author_name { Faker::Name.name }
    association :task
  end

  factory :no_author_comment, class: 'Comment' do
    body { Faker::Lorem.sentence }
    association :task
  end

  factory :no_task_comment, class: 'Comment' do
    body { Faker::Lorem.sentence }
    author_name { Faker::Name.name }
  end

end
