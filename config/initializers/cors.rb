Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*' # Change this to the domain(s) you want to allow requests from
      resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: false
    end
  end
  