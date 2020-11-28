require 'test_helper'

class PasajesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pasaje = pasajes(:one)
  end

  test "should get index" do
    get pasajes_url
    assert_response :success
  end

  test "should get new" do
    get new_pasaje_url
    assert_response :success
  end

  test "should create pasaje" do
    assert_difference('Pasaje.count') do
      post pasajes_url, params: { pasaje: { : @pasaje., precio: @pasaje.precio } }
    end

    assert_redirected_to pasaje_url(Pasaje.last)
  end

  test "should show pasaje" do
    get pasaje_url(@pasaje)
    assert_response :success
  end

  test "should get edit" do
    get edit_pasaje_url(@pasaje)
    assert_response :success
  end

  test "should update pasaje" do
    patch pasaje_url(@pasaje), params: { pasaje: { : @pasaje., precio: @pasaje.precio } }
    assert_redirected_to pasaje_url(@pasaje)
  end

  test "should destroy pasaje" do
    assert_difference('Pasaje.count', -1) do
      delete pasaje_url(@pasaje)
    end

    assert_redirected_to pasajes_url
  end
end
