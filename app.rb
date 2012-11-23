require './lib/demo-cubano'

# Cuba.use Rack::Reloader, 0

Cuba.define do
  on default do
    run DemoCubano
  end
end