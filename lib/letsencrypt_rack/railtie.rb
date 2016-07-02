module LetsencryptRack
  class Railtie < Rails::Railtie
    initializer "letsencrypt_rack.insert_middleware" do |app|
      app.config.middleware.use LetsencryptRack::Middleware
    end
  end
end
