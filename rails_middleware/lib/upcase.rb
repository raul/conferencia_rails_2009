# save as RAILS_ROOT/lib/upcase.rb
class Upcase
  def initialize(app)
    @app = app
  end
  def call(env)
    status, headers, response = @app.call(env)
    response.each{ |str| str.upcase! }
    [ status, headers, response ]
  end
end
