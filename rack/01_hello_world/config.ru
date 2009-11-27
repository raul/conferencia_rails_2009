# Minimal hello world rack application
# 
# Run it via rackup: rackup config.ru (port 9292 by default)

class HelloWorld
  # Each incoming request invokes the application's call method
  def call(env) # receives a hash with request data & rack config
    [
      200,                              # status code
      {"Content-Type" => "text/html"},  # HTTP headers
      ["Hello world!"]                  # content, should respond to 'each'
    ]
  end  
end

# don't forget to run it
run HelloWorld.new