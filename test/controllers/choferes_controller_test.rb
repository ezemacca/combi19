require 'test_helper'

class ChoferesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get choferes_index_url
    assert_response :success
  end

end
