class Demo
  def call(env)
    [ 200, {'Content-Type' => 'text/html'}, ['Hello world!'] ]
  end
end

class UpcaseFilter
  def initialize(app)
    @app = app
  end
  def call(env)
    status, headers, body = @app.call(env)
    body.each{ |str| str.upcase! }
    [ status, headers, body ]
  end
end

use UpcaseFilter
run Demo.new
