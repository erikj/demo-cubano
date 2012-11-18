require "cuba"
require "cuba/render"

Cuba.plugin Cuba::Render
# Cuba.use Rack::Session::Cookie

Cuba.define do
  on get do
    on "hello" do
      res.write "Hello world!"
    end

    on root do
      res.redirect "/hello"
    end

    on "readme" do
      res.write render 'README.md'
    end
  end
end
