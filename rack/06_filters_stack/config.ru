class Demo
  def call(env)
    [200, { 'Content-Type' => 'text/html'}, "req:#{env['QUERY_STRING']}<hr />resp:"]
  end
end

class BaseFilter
  def initialize(app); @app = app; end
end

class Filter1 < BaseFilter
  def call(env)
    env['QUERY_STRING'] << ' 1'
    response = @app.call(env)
    response.last << ' 1'
    response
  end
end

class Filter2 < BaseFilter
  def call(env)
    env['QUERY_STRING'] << ' 2'
    response = @app.call(env)
    response.last << ' 2'
    response
  end
end

# filters are stacked
use Filter1
use Filter2
run Demo.new
