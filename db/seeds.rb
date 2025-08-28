# Seeds

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
            task.comments.create!(
            body: Faker::Lorem.paragraph,
            author_name: Faker::Name.name
            )
        end
    end
end