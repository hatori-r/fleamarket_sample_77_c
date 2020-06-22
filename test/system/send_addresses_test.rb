require "application_system_test_case"

class SendAddressesTest < ApplicationSystemTestCase
  setup do
    @send_address = send_addresses(:one)
  end

  test "visiting the index" do
    visit send_addresses_url
    assert_selector "h1", text: "Send Addresses"
  end

  test "creating a Send address" do
    visit send_addresses_url
    click_on "New Send Address"

    fill_in "Address", with: @send_address.address
    fill_in "Apartment", with: @send_address.apartment
    fill_in "City", with: @send_address.city
    fill_in "Post number", with: @send_address.post_number
    fill_in "Prefectures", with: @send_address.prefectures
    fill_in "Send family kana", with: @send_address.send_family_kana
    fill_in "Send family name", with: @send_address.send_family_name
    fill_in "Send first kana", with: @send_address.send_first_kana
    fill_in "Send first name", with: @send_address.send_first_name
    fill_in "Sendscol", with: @send_address.sendscol
    fill_in "Tell number", with: @send_address.tell_number
    fill_in "User", with: @send_address.user_id
    click_on "Create Send address"

    assert_text "Send address was successfully created"
    click_on "Back"
  end

  test "updating a Send address" do
    visit send_addresses_url
    click_on "Edit", match: :first

    fill_in "Address", with: @send_address.address
    fill_in "Apartment", with: @send_address.apartment
    fill_in "City", with: @send_address.city
    fill_in "Post number", with: @send_address.post_number
    fill_in "Prefectures", with: @send_address.prefectures
    fill_in "Send family kana", with: @send_address.send_family_kana
    fill_in "Send family name", with: @send_address.send_family_name
    fill_in "Send first kana", with: @send_address.send_first_kana
    fill_in "Send first name", with: @send_address.send_first_name
    fill_in "Sendscol", with: @send_address.sendscol
    fill_in "Tell number", with: @send_address.tell_number
    fill_in "User", with: @send_address.user_id
    click_on "Update Send address"

    assert_text "Send address was successfully updated"
    click_on "Back"
  end

  test "destroying a Send address" do
    visit send_addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Send address was successfully destroyed"
  end
end
