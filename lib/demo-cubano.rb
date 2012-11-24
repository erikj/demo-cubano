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
        res.write render('views/layout.haml') { render('views/index.haml') }
      end

      on "readme" do
        res.write render('views/layout.haml') { render 'README.md' }
      end

      on "inspect" do
        res.write render('views/layout.haml') {
          [
           render( 'views/inspect.haml', {:o=>req, :float=>'left'},  :ugly=>true ),
           render( 'views/inspect.haml', {:o=>res, :float=>'right'}, :ugly=>true )
          ].join("\n")
        }
      end

      on 'css', extension('css') do |file|
        res.headers["Content-Type"] = "text/css; charset=utf-8"
        res.write File.read "css/#{file}.css"
      end

      on true do
        res.status = 404
        res.write "<h1>404: Not Found</h1>"
      end

    end
  end

end