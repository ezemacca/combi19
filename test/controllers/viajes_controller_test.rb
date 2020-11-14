require 'test_helper'

class ViajesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @viaje = viajes(:one)
  end

  test "should get index" do
    get viajes_url
    assert_response :success
  end

  test "should get new" do
    get new_viaje_url
    assert_response :success
  end

  test "should create viaje" do
    assert_difference('Viaje.count') do
      post viajes_url, params: { viaje: { chofer: @viaje.chofer, combi: @viaje.combi, destino: @viaje.destino, eliminado: @viaje.eliminado, fecha: @viaje.fecha, origen: @viaje.origen, ruta: @viaje.ruta } }
    end

    assert_redirected_to viaje_url(Viaje.last)
  end

  test "should show viaje" do
    get viaje_url(@viaje)
    assert_response :success
  end

  test "should get edit" do
    get edit_viaje_url(@viaje)
    assert_response :success
  end

  test "should update viaje" do
    patch viaje_url(@viaje), params: { viaje: { chofer: @viaje.chofer, combi: @viaje.combi, destino: @viaje.destino, eliminado: @viaje.eliminado, fecha: @viaje.fecha, origen: @viaje.origen, ruta: @viaje.ruta } }
    assert_redirected_to viaje_url(@viaje)
  end

  test "should destroy viaje" do
    assert_difference('Viaje.count', -1) do
      delete viaje_url(@viaje)
    end

    assert_redirected_to viajes_url
  end
end
