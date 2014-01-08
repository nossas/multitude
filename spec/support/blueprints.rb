require 'machinist/active_record'

User.blueprint do
  first_name { "Morgan" }
  last_name { "Freeman" }
  email { "test#{sn}@meurio.org.br" }
end
