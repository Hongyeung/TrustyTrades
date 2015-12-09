tags = ["roofing", "plumbing", "scaffolding", "electrical", "general_labour"]

tags.each do |tag|
  Tag.create({kind: tag})
end

# numbers = [1, 2, 3, 4, 5]
15.times do
  u = User.new({first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               email: Faker::Internet.email,
               company_name: Faker::Company.name,
               phone_number: Faker::PhoneNumber.cell_phone,
               password: "steezpatrol"
               })
  # u.tags = Tag.find_by_id(numbers.sample).id
  u.save
end

users = User.all
15.times do
  GeneralReview.create({rating: Faker::Number.between(1, 5),
                        name: Faker::Hacker.adjective,
                        body: Faker::Lorem.sentence,
                        reviewer_id: users.sample.id,
                        reviewee_id: users.sample.iuser.d
                        })
end

15.times do
  Job.create({budget: 400,
              name: Faker::Hacker.noun,
              description: Faker::Lorem.sentences,
              user_id: users.sample.id
              })
end
