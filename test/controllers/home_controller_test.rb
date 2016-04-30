require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :redirect
    # it will fail cause the response isn't redirect
  end

end
#rake test test/controllers/home_controller_test.rb

# i included include Devise::TestHelpers in the test_helper
