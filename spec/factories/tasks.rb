FactoryBot.define do
  factory :task do
    title { 'Sample Task' }
    description { 'Sample task description' }
    status { "Backlog" }
    deadline { Time.zone.now }
    association :user, factory: :user
  end
end
