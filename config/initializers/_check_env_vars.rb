if Rails.env.production? || Rails.env.staging?
  # sync Meu Rio rewards
  raise "MEURIO_HOST is missing"      if ENV['MEURIO_HOST'].nil?
  raise "MEURIO_API_TOKEN is missing" if ENV['MEURIO_API_TOKEN'].nil?
end
