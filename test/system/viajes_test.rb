require "application_system_test_case"

class ViajesTest < ApplicationSystemTestCase
  setup do
    @viaje = viajes(:one)
  end

  test "visiting the index" do
    visit viajes_url
    assert_selector "h1", text: "Viajes"
  end

  test "creating a Viaje" do
    visit viajes_url
    click_on "New Viaje"

    fill_in "Chofer", with: @viaje.chofer
    fill_in "Combi", with: @viaje.combi
    fill_in "Destino", with: @viaje.destino
    check "Eliminado" if @viaje.eliminado
    fill_in "Fecha", with: @viaje.fecha
    fill_in "Origen", with: @viaje.origen
    fill_in "Ruta", with: @viaje.ruta
    click_on "Create Viaje"

    assert_text "Viaje was successfully created"
    click_on "Back"
  end

  test "updating a Viaje" do
    visit viajes_url
    click_on "Edit", match: :first

    fill_in "Chofer", with: @viaje.chofer
    fill_in "Combi", with: @viaje.combi
    fill_in "Destino", with: @viaje.destino
    check "Eliminado" if @viaje.eliminado
    fill_in "Fecha", with: @viaje.fecha
    fill_in "Origen", with: @viaje.origen
    fill_in "Ruta", with: @viaje.ruta
    click_on "Update Viaje"

    assert_text "Viaje was successfully updated"
    click_on "Back"
  end

  test "destroying a Viaje" do
    visit viajes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Viaje was successfully destroyed"
  end
end
