module LetsencryptRack
  class Railtie < Rails::Railtie
    initializer "letsencrypt_rack.insert_middleware" do |app|
      app.config.middleware.unshift LetsencryptRack::Middleware
    end
  end
end
