class Demo
  def call(env)
    post_params = Rack::Request.new(env).POST
    body = <<-HTML
    <form action="/" method="post">
      <input type="text" name="_method" value="#{post_params['_method']}" />
      <input type="submit" />
    </form>
    <p>REST method: #{env['REQUEST_METHOD']}</p>
    HTML
    [200, {"Content-Type" => "text/html"}, body]
  end  
end

use Rack::MethodOverride # applies the _method REST trick
run Demo.new
