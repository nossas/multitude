if Rails.env.test?
  ENV["MEURIO_HOST"] = "http://www.meurio-dev.org.br"
  ENV["MEURIO_API_TOKEN"] = "123"
end
