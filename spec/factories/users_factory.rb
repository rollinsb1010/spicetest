# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name        { Faker::Name.first_name }
    last_name         { Faker::Name.last_name }
    email             { Faker::Internet.email }
    dealership
    active            true

    factory :inactive_user do
      active false
    end

    factory :salesperson, class: "Salesperson" do
      permission_ids  { Permission.defaults_for('Salesperson').map(&:id) }
    end

    factory :sales_manager, class: "SalesManager" do
      permission_ids { Permission.defaults_for('Sales Manager').map(&:id) }
    end

  end
end