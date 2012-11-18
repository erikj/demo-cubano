require "cuba"

Cuba.use Rack::Session::Cookie

Cuba.define do
  on get do
    on "hello" do
      res.write "Hello world!"
    end

    on root do
      res.redirect "/hello"
    end
  end
end

# cat hello_world_test.rb
# require "cuba/test"

# scope do
#   test "Homepage" do
#     get "/"

#     follow_redirect!

#     assert_equal "Hello world!", last_response.body
#   end
# end