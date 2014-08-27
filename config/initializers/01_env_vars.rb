if Rails.env.test?
  ENV["MEURIO_HOST"] = "http://www.meurio-dev.org.br"
  ENV["MEURIO_API_TOKEN"] = "123"
  ENV["ACCOUNTS_HOST"] = "http://www.meurio-dev.org.br"
  ENV["ACCOUNTS_API_TOKEN"] = "123"
  ENV["CAS_SERVER_URL"] = "http://www.meurio-dev.org.br"
end
