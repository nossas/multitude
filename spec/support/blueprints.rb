require 'machinist/active_record'

User.blueprint do
  first_name { "Morgan" }
  last_name { "Freeman" }
  email { "test#{sn}@meurio.org.br" }
end

TaskType.blueprint do
  name { "Type #{sn}" }
end

Task.blueprint do
  title { "An amazing task #{sn}" }
  hashtag { 'AmazingTask' }
  description { 'This is an amazing task' }
  task_type { TaskType.make! }
  points { 3 }
  deadline { Date.today + 1.week }
  skills { [:ciencias_politicas, :design_grafico, :direito] }
end

Delivery.blueprint do
  user { User.make! }
  task { Task.make! }
end
