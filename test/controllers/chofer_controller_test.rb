require 'test_helper'

class ChoferControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chofer_index_url
    assert_response :success
  end

end
