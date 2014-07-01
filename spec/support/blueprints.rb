require 'machinist/active_record'

User.blueprint do
  first_name { "Morgan" }
  last_name { "Freeman" }
  email { "test#{sn}@meurio.org.br" }
end

Category.blueprint do
  name { "Category #{sn}" }
end

TaskType.blueprint do
  name { "Type #{sn}" }
  category { Category.make! }
end

Task.blueprint do
  title { "An amazing task #{sn}" }
  hashtag { 'AmazingTask' }
  description { 'This is an amazing task' }
  task_type { TaskType.make! }
  points { 3 }
  deadline { Date.today + 1.week }
  skills { [:ciencias_politicas, :design_grafico, :direito] }
  mobilization { Mobilization.make! }
  user { User.make! }
  organization { Organization.make! }
end

Delivery.blueprint do
  task_subscription { TaskSubscription.make! }
end

Mobilization.blueprint do
  hashtag { "MyHashtag" }
  short_title { "My Mobilization Short Title" }
end

TaskSubscription.blueprint do
  user { User.make! }
  task { Task.make! }
end

Organization.blueprint do
end
