FactoryGirl.define do
  factory :hero do
    id       { 1 + rand(400) }
    name     { 'Mighty ' + Faker::Name.first_name }
    stars    { 1 + rand(10) }
    role     { Hero::ROLES[rand(Hero::ROLES.count)] }
    faction  { rand(Hero::FACTIONS.count) }

    factory :shardable_hero do
      stars  { 3 + rand(3) }
    end
  end
end
