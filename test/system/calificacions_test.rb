require "application_system_test_case"

class CalificacionsTest < ApplicationSystemTestCase
  setup do
    @calificacion = calificacions(:one)
  end

  test "visiting the index" do
    visit calificacions_url
    assert_selector "h1", text: "Calificacions"
  end

  test "creating a Calificacion" do
    visit calificacions_url
    click_on "New Calificacion"

    fill_in "Comentario", with: @calificacion.comentario
    fill_in "Puntaje", with: @calificacion.puntaje
    click_on "Create Calificacion"

    assert_text "Calificacion was successfully created"
    click_on "Back"
  end

  test "updating a Calificacion" do
    visit calificacions_url
    click_on "Edit", match: :first

    fill_in "Comentario", with: @calificacion.comentario
    fill_in "Puntaje", with: @calificacion.puntaje
    click_on "Update Calificacion"

    assert_text "Calificacion was successfully updated"
    click_on "Back"
  end

  test "destroying a Calificacion" do
    visit calificacions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Calificacion was successfully destroyed"
  end
end
