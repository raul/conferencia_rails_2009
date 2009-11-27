class Hi
  def call(env)
    [ 200, {"Content-Type" => "text/html"}, ["Hello world!"] ]
  end
end

class Bye
  def call(env)
    [ 200, {"Content-Type" => "text/html"}, ["Goodbye world!"] ]
  end
end

class Upcase
  def initialize(app); @app = app; end
  def call(env)
    response = @app.call(env)
    response.last.map{ |str| str.upcase! }
    response
  end
end

class Reverse
  def initialize(app); @app = app; end
  def call(env)
    response = @app.call(env)
    response.last.map{ |str| str.reverse! }
    response
  end  
end

use Upcase

map '/hi' do
  run Hi.new
end

map '/bye' do
  run Bye.new
end

map '/foo' do
  use Reverse
  run Hi.new
end
