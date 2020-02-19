require "application_system_test_case"

class BukkensTest < ApplicationSystemTestCase
  setup do
    @bukken = bukkens(:one)
  end

  test "visiting the index" do
    visit bukkens_url
    assert_selector "h1", text: "Bukkens"
  end

  test "creating a Bukken" do
    visit bukkens_url
    click_on "New Bukken"

    fill_in "Address", with: @bukken.address
    fill_in "Name", with: @bukken.name
    fill_in "Note", with: @bukken.note
    fill_in "Price", with: @bukken.price
    fill_in "Year", with: @bukken.year
    click_on "Create Bukken"

    assert_text "Bukken was successfully created"
    click_on "Back"
  end

  test "updating a Bukken" do
    visit bukkens_url
    click_on "Edit", match: :first

    fill_in "Address", with: @bukken.address
    fill_in "Name", with: @bukken.name
    fill_in "Note", with: @bukken.note
    fill_in "Price", with: @bukken.price
    fill_in "Year", with: @bukken.year
    click_on "Update Bukken"

    assert_text "Bukken was successfully updated"
    click_on "Back"
  end

  test "destroying a Bukken" do
    visit bukkens_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bukken was successfully destroyed"
  end
end
