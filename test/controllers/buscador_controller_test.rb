require 'test_helper'

class BuscadorControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get buscador_create_url
    assert_response :success
  end

end
