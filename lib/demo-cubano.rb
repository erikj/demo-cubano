require "cuba"
require "cuba/render"
require 'haml'
require 'redcarpet'

Cuba.plugin Cuba::Render

class DemoCubano < Cuba

  define do
    on get do
      on "hello" do
        res.write render('views/layout.haml') { "<h1>Hello world!</h1>" }
      end

      on root do
        res.write render('views/layout.haml') { render('views/root.haml') }
      end

      on "readme" do
        res.write render('views/layout.haml') { render 'README.md' }
      end

      on 'css', extension('css') do |file|
        res.headers["Content-Type"] = "text/css; charset=utf-8"
        res.write File.read "css/#{file}.css"
      end

    end
  end

end