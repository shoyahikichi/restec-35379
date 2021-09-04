FactoryBot.define do
  factory :user do
    name              {'test'}
    employee_number   {7}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
  end
end
