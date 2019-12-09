require "application_system_test_case"

class WarrantiesTest < ApplicationSystemTestCase
  setup do
    @warranty = warranties(:one)
  end

  test "visiting the index" do
    visit warranties_url
    assert_selector "h1", text: "Warranties"
  end

  test "creating a Warranty" do
    visit warranties_url
    click_on "New Warranty"

    fill_in "Client", with: @warranty.client_id
    fill_in "Product name", with: @warranty.product_name
    fill_in "Product serial number", with: @warranty.product_serial_number
    click_on "Create Warranty"

    assert_text "Warranty was successfully created"
    click_on "Back"
  end

  test "updating a Warranty" do
    visit warranties_url
    click_on "Edit", match: :first

    fill_in "Client", with: @warranty.client_id
    fill_in "Product name", with: @warranty.product_name
    fill_in "Product serial number", with: @warranty.product_serial_number
    click_on "Update Warranty"

    assert_text "Warranty was successfully updated"
    click_on "Back"
  end

  test "destroying a Warranty" do
    visit warranties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Warranty was successfully destroyed"
  end
end
