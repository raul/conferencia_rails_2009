# Rack::URLMap maps URLs or paths to applications

app1 = Proc.new{ |env| [200, {'Content-Type' => 'text/html'}, "Hi from app 1"] }
app2 = Proc.new{ |env| [200, {'Content-Type' => 'text/html'}, "Hi from app 2"] }
app3 = Proc.new{ |env| [200, {'Content-Type' => 'text/html'}, "Hi from app 3"] }

map "/app1" do
  run app1
end

map "/app2" do
  run app2
end

map "/app2/but-runs-app1" do # longer paths are preferred over short ones
  run app1
end

# catches unknown requests, unmapped paths show a "not found" message
map "/" do
  run app3
end

