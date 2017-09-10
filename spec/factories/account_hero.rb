FactoryGirl.define do
  # default is a whole hero with level 1..n
  factory :account_hero do
    association  :account
    association  :hero
    level        { 1 + rand(40) }

    # "sharded" is a specific hero (stars/name/faction) but in shards 1..n
    factory :sharded_account_hero do
      level   nil
      shards  { 1 + rand(20) }
    end

    # "generic sharded" is just the shards 1..n (stars/faction)
    factory :generic_sharded_account_hero do
      hero         nil
      level        nil
      association  :shard_type
      shards       { 1 + rand(20) }
    end

    # "wish list" is a specific hero (stars/name/faction) user doesn't have
    factory :wish_list_account_hero do
      level        nil
    end
  end
end