# Allow the metal piece to run in isolation
unless defined?(Rails)
  require(File.dirname(__FILE__) + "/../../config/environment")
end

class HelloWorld
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/hello_world/
      [200, {"Content-Type" => "text/html"}, ["Hello, World!"]]
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end
end
