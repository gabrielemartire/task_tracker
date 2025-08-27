# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


3.times do
    puts "Creating project..."
    project = Project.create!(
        name: Faker::App.name,
        description: Faker::Lorem.paragraph
    )
  
    5.times do
        puts "Creating task..."
        task = project.tasks.create!(
        title: Faker::Lorem.sentence(word_count: 3),
        status: Task.statuses.keys.sample,
        priority: rand(1..5),
        due_date: Faker::Date.forward(days: rand(10..24))
        )

        rand(1..6).times do
            puts "Creating comment..."
            task.comments.create!(  # usando l'associazione
            body: Faker::Lorem.paragraph,
            author_name: Faker::Name.name
            )
        end
    end
end