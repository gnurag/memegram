require 'rack/lobster'

map '/health' do
  health = proc do |env|
    [200, { "Content-Type" => "text/html" }, ["1"]]
  end
  run health
end

map '/lobster' do
  run Rack::Lobster.new
end

map '/' do
  welcome = proc do |env|
    [200, { "Content-Type" => "text/html" }, [<<WELCOME_CONTENTS
<!doctype html>
<html lang="en">
<head>
  <title>Welcome to OpenShift</title>
</head>
<body>
    <img src="troll-face.jpg" alt="Problem?" />
</body>
</html>
WELCOME_CONTENTS
    ]]
  end
  run welcome
end
