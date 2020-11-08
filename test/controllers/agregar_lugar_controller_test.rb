require 'test_helper'

class AgregarLugarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get agregar_lugar_index_url
    assert_response :success
  end

end
