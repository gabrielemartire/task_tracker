FactoryBot.define do
  factory :project do
    name { Faker::App.name }
    description { Faker::Lorem.paragraph }
  end
  factory :no_descr_project, class: 'Project' do
    name { Faker::App.name }
  end
  factory :no_name_project, class: 'Project' do
    description { Faker::Lorem.paragraph }
  end
end
