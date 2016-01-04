tags_names = ["roofing", "plumbing", "scaffolding", "electrical", "general_labour"]

tags_names.each do |tag|
  Tag.create({kind: tag})
end

tags = Tag.all

15.times do
  u = User.new({first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               email: Faker::Internet.email,
               company_name: Faker::Company.name,
               phone_number: Faker::PhoneNumber.cell_phone,
               password: "steezpatrol"
               })
  u.tags << tags.sample
  # u.tags = Tag.find_by_id(numbers.sample).id
  u.save
end

users = User.all
60.times do
  GeneralReview.create({rating: Faker::Number.between(1, 5),
                        name: Faker::Hacker.adjective,
                        body: Faker::Lorem.sentence,
                        reviewer_id: users.sample.id,
                        reviewee_id: users.sample.id
                        })
end

5.times do
  job = Job.new({budget: 400,
              name: Faker::Hacker.noun,
              description: Faker::Lorem.sentences,
              user_id: users.sample.id
              })
  job.tags << tags.sample
  job.save
end

three_tags = Tag.find([1, 3, 5])
5.times do
  job = Job.new({budget: 400,
              name: Faker::Hacker.noun,
              description: Faker::Lorem.sentences,
              user_id: users.sample.id
              })
  three_tags.each do |tag|
    job.tags << tag
  end
  job.save
end
