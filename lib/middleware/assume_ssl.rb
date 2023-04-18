# Backported from Rails 7.1:
# https://github.com/rails/rails/blob/main/actionpack/lib/action_dispatch/middleware/assume_ssl.rb

# When proxying through a load balancer that terminates SSL, the forwarded request will appear
# as though its HTTP instead of HTTPS to the application. This makes redirects and cookie
# security target HTTP instead of HTTPS. This middleware makes the server assume that the
# proxy already terminated SSL, and that the request really is HTTPS.
class AssumeSSL
  def initialize(app)
    @app = app
  end

  def call(env)
    env["HTTPS"] = "on"
    env["HTTP_X_FORWARDED_PORT"] = 443
    env["HTTP_X_FORWARDED_PROTO"] = "https"
    env["rack.url_scheme"] = "https"

    @app.call(env)
  end
end
