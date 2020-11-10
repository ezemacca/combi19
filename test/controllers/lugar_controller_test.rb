require 'test_helper'

class LugarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lugar_index_url
    assert_response :success
  end

end
