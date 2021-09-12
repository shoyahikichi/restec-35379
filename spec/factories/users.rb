FactoryBot.define do
  factory :user do
    name                  {Faker::Name.last_name}
    employee_number       {7}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
  end
end
