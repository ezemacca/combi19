require 'test_helper'

class RutaControllerTest < ActionDispatch::IntegrationTest
  test "should get alta" do
    get ruta_alta_url
    assert_response :success
  end

end
