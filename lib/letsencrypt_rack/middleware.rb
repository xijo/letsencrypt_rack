module LetsencryptRack
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if result = challenge_answer(env)
        [ 200, { 'Content-Type' => 'text/plain', 'Content-Length' => result.size.to_s }, [ result ] ]
      else
        @app.call(env)
      end
    end

    private

    def challenge_answer(env)
      path = env['REQUEST_PATH'].to_s
      path.start_with?('/.well-known/acme-challenge') or return

      response = ENV['LETSENCRYPT_RESPONSE'].to_s
      response.empty? and return 'Challenge failed - No LETSENCRYPT_RESPONSE found in env'

      challenge = path[/\/.well-known\/acme-challenge\/(.*)/, 1]
      challenge.empty? and return 'Challenge failed - Empty challenge request'

      response.split(?.).first == challenge or return 'Challenge failed - The challenge did not match LETSENCRYPT_RESPONSE'
      response
    end
  end
end
