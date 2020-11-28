require "application_system_test_case"

class PasajesTest < ApplicationSystemTestCase
  setup do
    @pasaje = pasajes(:one)
  end

  test "visiting the index" do
    visit pasajes_url
    assert_selector "h1", text: "Pasajes"
  end

  test "creating a Pasaje" do
    visit pasajes_url
    click_on "New Pasaje"

    fill_in "", with: @pasaje.
    fill_in "Precio", with: @pasaje.precio
    click_on "Create Pasaje"

    assert_text "Pasaje was successfully created"
    click_on "Back"
  end

  test "updating a Pasaje" do
    visit pasajes_url
    click_on "Edit", match: :first

    fill_in "", with: @pasaje.
    fill_in "Precio", with: @pasaje.precio
    click_on "Update Pasaje"

    assert_text "Pasaje was successfully updated"
    click_on "Back"
  end

  test "destroying a Pasaje" do
    visit pasajes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pasaje was successfully destroyed"
  end
end
