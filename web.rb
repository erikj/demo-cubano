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
      res.write render('views/layout.haml') { render('views/root.haml') }
    end

    on "readme" do
      res.write render 'README.md'
    end

    on 'css', extension('css') do |file|
      res.headers["Content-Type"] = "text/css; charset=utf-8"
      res.write File.read "css/#{file}.css"
    end

  end
end
